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

def _debs_impl(ctx):
    name = str(ctx.label).split(":")[1]
    debs = " ".join([f.path for f in ctx.files.debs])
    ctx.actions.run(
        executable = ctx.executable._wrapper,
        arguments = [
            name,
            debs,
            ctx.outputs.tar.path,
            ctx.outputs.deb.path,
            ctx.file.script.path,
            ctx.attr.args,
        ],
        inputs = [
            ctx.file.script,
        ] + ctx.files.debs,
        outputs = [
            ctx.outputs.tar,
            ctx.outputs.deb,
        ],
    )

_repkg_debs = rule(
    attrs = {
        "debs": attr.label_list(
            allow_files = [".deb"],
            mandatory = True,
        ),
        "script": attr.label(
            allow_single_file = [".sh"],
            mandatory = True,
        ),
        "args": attr.string(),
        "_wrapper": attr.label(
            default = Label("@com_github_discolix_discolix//repkg:wrapper"),
            cfg = "host",
            executable = True,
            allow_files = True,
        ),
    },
    executable = False,
    outputs = {
        "tar": "%{name}.tar",
        "deb": "%{name}.deb",
    },
    implementation = _debs_impl,
)

def repkg_debs(**kwargs):
    _repkg_debs(**kwargs)
