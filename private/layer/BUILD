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

load("@io_bazel_rules_docker//container:container.bzl", "container_layer")
load("//private:debian_buster.bzl", "debian_buster")
load("//private:platforms.bzl", "PLATFORMS")

package(default_visibility = ["//:discolix_all"])

# root layer

root_env = {
    "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    # allows openssl to find the certificates by default
    "SSL_CERT_FILE": "/etc/ssl/certs/ca-certificates.crt",
}

[container_layer(
    name = "root-" + platform,
    debs = [
        debian_buster[arch]["base-files"],
        debian_buster["noarch"]["netbase"],
        debian_buster["noarch"]["tzdata"],
    ],
    env = root_env,
    tars = ["//private/repkg:ca-certificates.tar"],
) for (platform, os, arch) in PLATFORMS]

# debug layer

[container_layer(
    name = "debug-" + platform,
    directory = "/busybox",
    env = {"PATH": "$$PATH:/busybox/bin"},
    tars = ["//private/repkg:busybox-static-" + arch + ".tar"],
) for (platform, os, arch) in PLATFORMS]

# qemu layer
# used for testing arm images under emulation on linux_amd64
container_layer(
    name = "qemu-static",
    tars = ["//private/repkg:qemu-static.tar"],
)
