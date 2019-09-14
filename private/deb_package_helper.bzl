# Copyright 2019 Erik Maciejewski
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

def update_deb_package_dependencies():
    go_rules_dependencies()
    go_register_toolchains()
    gazelle_dependencies()

    # "golang.org/x/crypto/openpgp"
    go_repository(
        name = "org_golang_x_crypto",
        commit = "d585fd2cc9195196078f516b69daff6744ef5e84",
        importpath = "golang.org/x/crypto",
    )

    # "github.com/knqyf263/go-deb-version"
    go_repository(
        name = "com_github_knqyf263_go_deb_version",
        commit = "9865fe14d09b1c729188ac810466dde90f897ee3",
        importpath = "github.com/knqyf263/go-deb-version",
    )

    # "github.com/stapelberg/godebiancontrol"
    go_repository(
        name = "com_github_stapelberg_godebiancontrol",
        commit = "4376b22fb2c4dfda546c972f686310af907819b2",
        importpath = "github.com/stapelberg/godebiancontrol",
    )

_script_content = """
BASE=$(pwd)
WORKSPACE=$(dirname $(readlink WORKSPACE))
cd "$WORKSPACE"
$BASE/{update_deb_packages} {args} $@
"""

def _update_deb_packages_script_impl(ctx):
    args = ctx.attr.args
    script_content = _script_content.format(update_deb_packages = ctx.file._update_deb_packages.short_path, args = " ".join(args))
    script_file = ctx.new_file(ctx.label.name + ".bash")
    ctx.file_action(output = script_file, executable = True, content = script_content)
    return struct(
        files = depset([script_file]),
        runfiles = ctx.runfiles([ctx.file._update_deb_packages]),
    )

_update_deb_packages_script = rule(
    _update_deb_packages_script_impl,
    attrs = {
        "args": attr.string_list(),
        "pgp_keys": attr.label_list(),
        "_update_deb_packages": attr.label(
            default = Label("@deb_package//tools/update_deb_packages/src:update_deb_packages"),
            allow_single_file = True,
            executable = True,
            cfg = "host",
        ),
    },
)

def update_deb_packages(name, pgp_keys, **kwargs):
    script_name = name + "_script"
    _update_deb_packages_script(
        name = script_name,
        tags = ["manual"],
        **kwargs
    )
    native.sh_binary(
        name = name,
        srcs = [script_name],
        data = ["//:WORKSPACE"] + pgp_keys,
        tags = ["manual"],
    )
