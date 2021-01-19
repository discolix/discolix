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
load("@com_github_emacski_bazeltools//repkg:defs.bzl", "repkg_debs")
load("//private:debian_buster.bzl", "debian_buster", "debian_buster_security")
load("//private:platforms.bzl", "PLATFORMS")
load("//private/noarch:files.bzl", "NONROOT")

package(default_visibility = ["//visibility:public"])

# python

[repkg_debs(
    name = "python3.7-" + arch,
    debs = [
        debian_buster[arch]["python3.7-minimal"],
        debian_buster[arch]["libpython3.7-minimal"],
        debian_buster[arch]["libpython3.7-stdlib"],
        debian_buster["noarch"]["python3-lib2to3"],
    ],
    script = ":repkg_python3.7.sh",
) for (platform, os, arch) in PLATFORMS]

[container_image(
    name = platform,
    architecture = arch,
    base = "//cc:" + platform,
    debs = [
        debian_buster[arch]["zlib1g"],
        debian_buster_security[arch]["libexpat1"],
        # libpython3.7-stdlib deps
        debian_buster[arch]["dash"],
        debian_buster[arch]["libbz2-1.0"],
        debian_buster[arch]["libdb5.3"],
        debian_buster[arch]["libffi6"],
        debian_buster[arch]["liblzma5"],
        debian_buster[arch]["libmpdec2"],
        debian_buster[arch]["libncursesw6"],
        debian_buster[arch]["libreadline7"],
        debian_buster[arch]["libsqlite3-0"],
        debian_buster[arch]["libtinfo6"],
        debian_buster[arch]["libuuid1"],
        debian_buster["noarch"]["mime-support"],
        debian_buster["noarch"]["readline-common"],
    ],
    entrypoint = ["/usr/bin/python"],
    stamp = True,
    tars = [":python3.7-" + arch + ".tar"],
) for (platform, os, arch) in PLATFORMS]

# python non-root

[container_image(
    name = "nonroot-" + platform,
    architecture = arch,
    base = ":" + platform,
    stamp = True,
    user = "%d" % NONROOT,
    workdir = "/home/nonroot",
) for (platform, os, arch) in PLATFORMS]

# python debug

[container_image(
    name = "debug-" + platform,
    architecture = arch,
    base = ":" + platform,
    entrypoint = ["/busybox/bin/sh"],
    layers = ["//private/layer:debug-" + platform],
    stamp = True,
) for (platform, os, arch) in PLATFORMS]

# python debug non-root

[container_image(
    name = "debug-nonroot-" + platform,
    architecture = arch,
    base = ":nonroot-" + platform,
    entrypoint = ["/busybox/bin/sh"],
    layers = ["//private/layer:debug-" + platform],
    stamp = True,
) for (platform, os, arch) in PLATFORMS]

# pip

repkg_debs(
    name = "pip3-noarch",
    debs = [
        debian_buster["noarch"]["python3-pip"],
        debian_buster["noarch"]["python3-distutils"],
        debian_buster["noarch"]["python3-setuptools"],
        debian_buster["noarch"]["python3-pkg-resources"],
    ],
    script = ":repkg_pip3.sh",
)

[container_image(
    name = "pip-" + platform,
    architecture = arch,
    base = ":" + platform,
    debs = [
        debian_buster["noarch"]["python-pip-whl"],
    ],
    stamp = True,
    tars = [
        ":pip3-noarch.tar",
    ],
) for (platform, os, arch) in PLATFORMS]
