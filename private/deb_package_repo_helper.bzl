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

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def update_deb_package_repos():
    # download the rules_go repository to add support for building go projects
    # https://github.com/bazelbuild/rules_go
    http_archive(
        name = "io_bazel_rules_go",
        sha256 = "8df59f11fb697743cbb3f26cfb8750395f30471e9eabde0d174c3aebc7a1cd39",
        urls = [
            "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/0.19.1/rules_go-0.19.1.tar.gz",
            "https://github.com/bazelbuild/rules_go/releases/download/0.19.1/rules_go-0.19.1.tar.gz",
        ],
    )

    http_archive(
        name = "bazel_gazelle",
        sha256 = "be9296bfd64882e3c08e3283c58fcb461fa6dd3c171764fcc4cf322f60615a9b",
        urls = [
            "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/0.18.1/bazel-gazelle-0.18.1.tar.gz",
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/0.18.1/bazel-gazelle-0.18.1.tar.gz",
        ],
    )
