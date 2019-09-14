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

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")

# base

container_test(
    name = "base",
    size = "small",
    configs = ["//tests:base.yaml"],
    image = "//base:linux_amd64",
)

go_binary(
    name = "check_certs",
    srcs = ["//tests:check_certs.go"],
    goarch = "amd64",
    goos = "linux",
    pure = "on",
)

container_image(
    name = "check_certs_image",
    base = "//base:linux_amd64",
    files = [":check_certs"],
    visibility = ["//visibility:private"],
)

container_test(
    name = "certs",
    size = "small",
    configs = ["//tests:certs.yaml"],
    image = ":check_certs_image",
)

# debug

container_test(
    name = "debug",
    size = "small",
    configs = ["//tests:debug.yaml"],
    image = "//base:debug-linux_amd64",
)
