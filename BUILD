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

load("@io_bazel_rules_docker//container:container.bzl", "container_bundle")

package(default_visibility = ["//visibility:public"])

exports_files(["WORKSPACE"])

package_group(
    name = "discolix_all",
    includes = [
        ":discolix_private",
        ":discolix_public",
    ],
)

package_group(
    name = "discolix_public",
    packages = [
        "//base/...",
        "//cc/...",
        "//python/...",
    ],
)

package_group(
    name = "discolix_private",
    packages = [
        "//private/layer/...",
        "//private/noarch/...",
        "//private/repkg/...",
        "//tests/...",
    ],
)

container_bundle(
    name = "load_all_images",
    images = {
        "{PROJECT_REGISTRY_PREFIX}/static:{PROJECT_GIT_COMMIT}-linux_amd64": "//base:static-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/static:{PROJECT_GIT_COMMIT}-linux_arm64": "//base:static-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/static:{PROJECT_GIT_COMMIT}-linux_arm": "//base:static-linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/static:nonroot-linux_amd64": "//base:static-nonroot-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/static:nonroot-linux_arm64": "//base:static-nonroot-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/static:nonroot-linux_arm": "//base:static-nonroot-linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/base:{PROJECT_GIT_COMMIT}-linux_amd64": "//base:linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/base:{PROJECT_GIT_COMMIT}-linux_arm64": "//base:linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/base:{PROJECT_GIT_COMMIT}-linux_arm": "//base:linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/base:nonroot-linux_amd64": "//base:nonroot-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/base:nonroot-linux_arm64": "//base:nonroot-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/base:nonroot-linux_arm": "//base:nonroot-linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-linux_amd64": "//base:debug-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-linux_arm64": "//base:debug-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-linux_arm": "//base:debug-linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-nonroot-linux_amd64": "//base:debug-nonroot-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-nonroot-linux_arm64": "//base:debug-nonroot-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/base:debug-nonroot-linux_arm": "//base:debug-nonroot-linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/cc:{PROJECT_GIT_COMMIT}-linux_amd64": "//cc:linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/cc:{PROJECT_GIT_COMMIT}-linux_arm64": "//cc:linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/cc:{PROJECT_GIT_COMMIT}-linux_arm": "//cc:linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/cc:nonroot-linux_amd64": "//cc:nonroot-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/cc:nonroot-linux_arm64": "//cc:nonroot-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/cc:nonroot-linux_arm": "//cc:nonroot-linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-linux_amd64": "//cc:debug-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-linux_arm64": "//cc:debug-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-linux_arm": "//cc:debug-linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-nonroot-linux_amd64": "//cc:debug-nonroot-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-nonroot-linux_arm64": "//cc:debug-nonroot-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/cc:debug-nonroot-linux_arm": "//cc:debug-nonroot-linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/python:{PROJECT_GIT_COMMIT}-linux_amd64": "//python:linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/python:{PROJECT_GIT_COMMIT}-linux_arm64": "//python:linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/python:{PROJECT_GIT_COMMIT}-linux_arm": "//python:linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/python:nonroot-linux_amd64": "//python:nonroot-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/python:nonroot-linux_arm64": "//python:nonroot-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/python:nonroot-linux_arm": "//python:nonroot-linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/python:debug-linux_amd64": "//python:debug-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/python:debug-linux_arm64": "//python:debug-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/python:debug-linux_arm": "//python:debug-linux_arm",
        "{PROJECT_REGISTRY_PREFIX}/python:debug-nonroot-linux_amd64": "//python:debug-nonroot-linux_amd64",
        "{PROJECT_REGISTRY_PREFIX}/python:debug-nonroot-linux_arm64": "//python:debug-nonroot-linux_arm64",
        "{PROJECT_REGISTRY_PREFIX}/python:debug-nonroot-linux_arm": "//python:debug-nonroot-linux_arm",
    },
)
