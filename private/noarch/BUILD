# Copyright 2019 Google Inc. All rights reserved.
# Modifications copyright 2019 Erik Maciejewski
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

package(default_visibility = ["//:discolix_all"])

load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@io_bazel_rules_docker//contrib:passwd.bzl", "passwd_entry", "passwd_tar")
load("@io_bazel_rules_docker//contrib:group.bzl", "group_entry", "group_file")

load(":files.bzl", "nsswitch_conf_file", "os_release_file", "NOBODY", "NONROOT")

# create root, nonroot and nobody users
passwd_entry(
    name = "root_user",
    gid = 0,
    home = "/root",
    info = "root",
    shell = "/sbin/nologin",
    uid = 0,
    username = "root",
)

passwd_entry(
    name = "nobody_user",
    create_home = False,
    gid = NOBODY,
    home = "/nonexistent",
    info = "nobody",
    shell = "/sbin/nologin",
    uid = NOBODY,
    username = "nobody",
)

passwd_entry(
    name = "nonroot_user",
    gid = NONROOT,
    home = "/home/nonroot",
    info = "nonroot",
    shell = "/sbin/nologin",
    uid = NONROOT,
    username = "nonroot",
)

passwd_tar(
    name = "passwd",
    entries = [
        ":root_user",
        ":nobody_user",
        ":nonroot_user",
    ],
    passwd_file_pkg_dir = "etc",
)

# create root, nonroot, nobody, tty, and staff groups
group_entry(
    name = "root_group",
    gid = 0,
    groupname = "root",
)

group_entry(
    name = "nobody_group",
    gid = NOBODY,
    groupname = "nobody",
)

group_entry(
    name = "nonroot_group",
    gid = NONROOT,
    groupname = "nonroot",
)

group_entry(
    name = "tty_group",
    gid = 5,
    groupname = "tty",
)

group_entry(
    name = "staff_group",
    gid = 50,
    groupname = "staff",
)

group_file(
    name = "group",
    entries = [
        ":root_group",
        ":nobody_group",
        ":tty_group",
        ":staff_group",
        ":nonroot_group",
    ],
)

nsswitch_conf_file(
    name = "nsswitch.conf",
    entries = {
        "passwd": "compat",
        "group": "compat",
        "shadow": "compat",
        "gshadow": "files",
        "hosts": "files dns",
        "networks": "files",
        "protocols": "db files",
        "services": "db files",
        "ethers": "db files",
        "rpc": "db files",
        "netgroup": "nis",
    },
)

os_release_file(
    name = "os-release",
    pretty_name = "discolix",
    release_name = "Debian GNU/Linux",
    version_id = "10",
    version = "10 (buster)",
    version_codename = "buster",
    id = "debian",
    home_url = "https://github.com/discolix/discolix",
    support_url = "https://github.com/discolix/discolix",
    bug_report_url = "https://github.com/discolix/discolix",
)

pkg_tar(
    name = "etc",
    srcs = [
        ":group",
        ":nsswitch.conf",
        ":os-release",
    ],
    mode = "0644",
    package_dir = "etc",
)

pkg_tar(
    name = "base-files",
    deps = [
        ":passwd",
        ":etc",
    ]
)
