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

# cc

container_image(
    name = "amd64",
    base = "//base:amd64",
    debs = [
        debian_buster_amd64["libgcc1"],
        debian_buster_amd64["libgomp1"],
        debian_buster_amd64["libstdc++6"],
    ],
    stamp = True,
)

container_image(
    name = "arm64",
    base = "//base:arm64",
    debs = [
        debian_buster_arm64["libgcc1"],
        debian_buster_arm64["libgomp1"],
        debian_buster_arm64["libstdc++6"],
    ],
    stamp = True,
)

container_image(
    name = "arm",
    base = "//base:arm",
    debs = [
        debian_buster_armhf["libgcc1"],
        debian_buster_armhf["libgomp1"],
        debian_buster_armhf["libstdc++6"],
    ],
    stamp = True,
)

# cc non-root

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
