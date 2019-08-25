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

load("@io_bazel_rules_docker//container:container.bzl", "container_bundle")

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

container_bundle(
    name = "load_all_images",
    images = {
        "{PROJECT_REGISTRY_PREFIX}/static:{PROJECT_GIT_COMMIT}-linux_amd64": "//base:static-amd64",
        "{PROJECT_REGISTRY_PREFIX}/static:{PROJECT_GIT_COMMIT}-linux_arm64": "//base:static-arm64",
        "{PROJECT_REGISTRY_PREFIX}/static:{PROJECT_GIT_COMMIT}-linux_arm": "//base:static-arm",
        "{PROJECT_REGISTRY_PREFIX}/static:nonroot-linux_amd64": "//base:static-nonroot-amd64",
        "{PROJECT_REGISTRY_PREFIX}/static:nonroot-linux_arm64": "//base:static-nonroot-arm64",
        "{PROJECT_REGISTRY_PREFIX}/static:nonroot-linux_arm": "//base:static-nonroot-arm",
        "{PROJECT_REGISTRY_PREFIX}/base:{PROJECT_GIT_COMMIT}-linux_amd64": "//base:amd64",
        "{PROJECT_REGISTRY_PREFIX}/base:{PROJECT_GIT_COMMIT}-linux_arm64": "//base:arm64",
        "{PROJECT_REGISTRY_PREFIX}/base:{PROJECT_GIT_COMMIT}-linux_arm": "//base:arm",
        "{PROJECT_REGISTRY_PREFIX}/base:nonroot-linux_amd64": "//base:nonroot-amd64",
        "{PROJECT_REGISTRY_PREFIX}/base:nonroot-linux_arm64": "//base:nonroot-arm64",
        "{PROJECT_REGISTRY_PREFIX}/base:nonroot-linux_arm": "//base:nonroot-arm",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-linux_amd64": "//base:debug-amd64",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-linux_arm64": "//base:debug-arm64",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-linux_arm": "//base:debug-arm",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-nonroot-linux_amd64": "//base:debug-nonroot-amd64",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-nonroot-linux_arm64": "//base:debug-nonroot-arm64",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-nonroot-linux_arm": "//base:debug-nonroot-arm",
        "{PROJECT_REGISTRY_PREFIX}/cc:{PROJECT_GIT_COMMIT}-linux_amd64": "//cc:amd64",
        "{PROJECT_REGISTRY_PREFIX}/cc:{PROJECT_GIT_COMMIT}-linux_arm64": "//cc:arm64",
        "{PROJECT_REGISTRY_PREFIX}/cc:{PROJECT_GIT_COMMIT}-linux_arm": "//cc:arm",
        "{PROJECT_REGISTRY_PREFIX}/cc:nonroot-linux_amd64": "//cc:nonroot-amd64",
        "{PROJECT_REGISTRY_PREFIX}/cc:nonroot-linux_arm64": "//cc:nonroot-arm64",
        "{PROJECT_REGISTRY_PREFIX}/cc:nonroot-linux_arm": "//cc:nonroot-arm",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-linux_amd64": "//cc:debug-amd64",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-linux_arm64": "//cc:debug-arm64",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-linux_arm": "//cc:debug-arm",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-nonroot-linux_amd64": "//cc:debug-nonroot-amd64",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-nonroot-linux_arm64": "//cc:debug-nonroot-arm64",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-nonroot-linux_arm": "//cc:debug-nonroot-arm",
    },
)

update_deb_packages(
    name = "update_deb_packages",
    pgp_keys = [
        "@buster_archive_key//file",
        "@buster_archive_security_key//file",
    ],
)
