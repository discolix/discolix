# Copyright 2020 Erik Maciejewski
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

load("@pip//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary")
load("@com_github_emacski_bazeltools//protobuf:python_rules.bzl", "py_proto_library")

exports_files(["requirements.txt"])

py_binary(
    name = "deb_checker",
    srcs = ["deb_checker.py"],
    data = [
        "//:WORKSPACE",
        "@bazel_buildtools//buildozer",
    ],
    deps = [
        ":buildozer_api_proto",
        requirement("requests"),
        requirement("notifiers"),
    ],
)

py_proto_library(
    name = "buildozer_api_proto",
    srcs_version = "PY3",
    deps = ["@bazel_buildtools//api_proto:api_proto_proto"],
)
