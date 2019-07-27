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

load("@io_bazel_rules_docker//container:container.bzl", "container_image")

load("@debian_buster_noarch//debs:deb_packages.bzl", "debian_buster_noarch")
load("@debian_buster_amd64//debs:deb_packages.bzl", "debian_buster_amd64")
load("@debian_buster_arm64//debs:deb_packages.bzl", "debian_buster_arm64")
load("@debian_buster_armhf//debs:deb_packages.bzl", "debian_buster_armhf")

load("//private/noarch:files.bzl", "NONROOT")

# static

container_image(
    name = "static-amd64",
    layers = ["//private/layers:root-amd64"],
    tars = ["//private/noarch:base-files"],
    stamp = True,
)

container_image(
    name = "static-arm64",
    layers = ["//private/layers:root-arm64"],
    tars = ["//private/noarch:base-files"],
    stamp = True,
)

container_image(
    name = "static-arm",
    layers = ["//private/layers:root-arm"],
    tars = ["//private/noarch:base-files"],
    stamp = True,
)

# static non-root

container_image(
    name = "static-nonroot-amd64",
    base = ":static-amd64",
    user = "%d" % NONROOT,
    workdir = "/home/nonroot",
    stamp = True,
)

container_image(
    name = "static-nonroot-arm64",
    base = ":static-arm64",
    user = "%d" % NONROOT,
    workdir = "/home/nonroot",
    stamp = True,
)

container_image(
    name = "static-nonroot-arm",
    base = ":static-arm",
    user = "%d" % NONROOT,
    workdir = "/home/nonroot",
    stamp = True,
)

# base

container_image(
    name = "amd64",
    base = ":static-amd64",
    debs = [
        debian_buster_amd64["libc6"],
        debian_buster_amd64["libssl1.1"],
        debian_buster_amd64["openssl"],
    ],
    stamp = True,
)

container_image(
    name = "arm64",
    base = ":static-arm64",
    debs = [
        debian_buster_arm64["libc6"],
        debian_buster_arm64["libssl1.1"],
        debian_buster_arm64["openssl"],
    ],
    stamp = True,
)

container_image(
    name = "arm",
    base = ":static-arm",
    debs = [
        debian_buster_armhf["libc6"],
        debian_buster_armhf["libssl1.1"],
        debian_buster_armhf["openssl"],
    ],
    stamp = True,
)

# base non-root

container_image(
    name = "nonroot-amd64",
    base = ":amd64",
    user = "%d" % NONROOT,
    workdir = "/home/nonroot",
    stamp = True,
)

container_image(
    name = "nonroot-arm64",
    base = ":arm64",
    user = "%d" % NONROOT,
    workdir = "/home/nonroot",
    stamp = True,
)

container_image(
    name = "nonroot-arm",
    base = ":arm",
    user = "%d" % NONROOT,
    workdir = "/home/nonroot",
    stamp = True,
)

# debug

container_image(
    name = "debug-amd64",
    base = ":amd64",
    layers = ["//private/layers:debug-amd64"],
    directory = "/",
    entrypoint = ["/busybox/sh"],
    stamp = True,
)

container_image(
    name = "debug-arm64",
    base = ":arm64",
    layers = ["//private/layers:debug-arm64"],
    directory = "/",
    entrypoint = ["/busybox/sh"],
    stamp = True,
)

container_image(
    name = "debug-arm",
    base = ":arm",
    layers = ["//private/layers:debug-arm"],
    directory = "/",
    entrypoint = ["/busybox/sh"],
    stamp = True,
)

# debug non-root

container_image(
    name = "debug-nonroot-amd64",
    base = ":debug-amd64",
    user = "%d" % NONROOT,
    workdir = "/home/nonroot",
    stamp = True,
)

container_image(
    name = "debug-nonroot-arm64",
    base = ":debug-arm64",
    user = "%d" % NONROOT,
    workdir = "/home/nonroot",
    stamp = True,
)

container_image(
    name = "debug-nonroot-arm",
    base = ":debug-arm",
    user = "%d" % NONROOT,
    workdir = "/home/nonroot",
    stamp = True,
)
