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

package(default_visibility = ["//visibility:public"])

load("@com_github_atlassian_bazel_tools//:multirun/def.bzl", "multirun")

load("//private:deb_package_helper.bzl", "update_deb_packages")

package_group(
    name = "discolix_all",
    includes = [
        ":discolix_public",
        ":discolix_private",
    ]
)

package_group(
    name = "discolix_public",
    packages = [
        "//base/...",
        "//cc/...",
    ],
)

package_group(
    name = "discolix_private",
    packages = [
        "//private/layers/...",
        "//private/noarch/...",
        "//tests/..."
    ],
)

multirun(
    name = "load_all_images",
    commands = [
        "//base:static-amd64",
        "//base:static-arm64",
        "//base:static-arm",
        "//base:static-nonroot-amd64",
        "//base:static-nonroot-arm64",
        "//base:static-nonroot-arm",
        "//base:amd64",
        "//base:arm64",
        "//base:arm",
        "//base:nonroot-amd64",
        "//base:nonroot-arm64",
        "//base:nonroot-arm",
        "//base:debug-amd64",
        "//base:debug-arm64",
        "//base:debug-arm",
        "//base:debug-nonroot-amd64",
        "//base:debug-nonroot-arm64",
        "//base:debug-nonroot-arm",
        "//cc:amd64",
        "//cc:arm64",
        "//cc:arm",
        "//cc:nonroot-amd64",
        "//cc:nonroot-arm64",
        "//cc:nonroot-arm",
        "//cc:debug-amd64",
        "//cc:debug-arm64",
        "//cc:debug-arm",
        "//cc:debug-nonroot-amd64",
        "//cc:debug-nonroot-arm64",
        "//cc:debug-nonroot-arm",
    ],
)

update_deb_packages(
    name = "update_deb_packages",
    pgp_keys = [
        "@buster_archive_key//file",
        "@buster_archive_security_key//file",
    ],
)
