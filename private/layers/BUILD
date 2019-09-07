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

package(default_visibility = ["//:discolix_all"])

load("@io_bazel_rules_docker//container:container.bzl", "container_layer")

load("@debian_buster_noarch//debs:deb_packages.bzl", "debian_buster_noarch")
load("@debian_buster_amd64//debs:deb_packages.bzl", "debian_buster_amd64")
load("@debian_buster_arm64//debs:deb_packages.bzl", "debian_buster_arm64")
load("@debian_buster_armhf//debs:deb_packages.bzl", "debian_buster_armhf")
load("@debian_buster_security_noarch//debs:deb_packages.bzl", "debian_buster_security_noarch")
load("@debian_buster_security_amd64//debs:deb_packages.bzl", "debian_buster_security_amd64")
load("@debian_buster_security_arm64//debs:deb_packages.bzl", "debian_buster_security_arm64")
load("@debian_buster_security_armhf//debs:deb_packages.bzl", "debian_buster_security_armhf")

load("//repkg:defs.bzl", "repkg_deb")
load(":busybox_commands.bzl", "BUSYBOX_COMMANDS")

# root layer

repkg_deb(
    name = "cacerts",
    script = ":repkg_ca-certificates.sh",
    deb = debian_buster_noarch["ca-certificates"],
)

root_env = {
    "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    # allows openssl to find the certificates by default
    "SSL_CERT_FILE": "/etc/ssl/certs/ca-certificates.crt",
}

container_layer(
    name = "root-amd64",
    env = root_env,
    debs = [
        debian_buster_amd64["base-files"],
        debian_buster_noarch["netbase"],
        debian_buster_noarch["tzdata"],
    ],
    tars = [":cacerts.tar"],
)

container_layer(
    name = "root-arm64",
    env = root_env,
    debs = [
        debian_buster_arm64["base-files"],
        debian_buster_noarch["netbase"],
        debian_buster_noarch["tzdata"],
    ],
    tars = [":cacerts.tar"],
)

container_layer(
    name = "root-arm",
    env = root_env,
    debs = [
        debian_buster_armhf["base-files"],
        debian_buster_noarch["netbase"],
        debian_buster_noarch["tzdata"],
    ],
    tars = [":cacerts.tar"],
)

# debug layer

repkg_deb(
    name = "busybox-amd64",
    script = ":repkg_busybox-static.sh",
    args = " ".join(BUSYBOX_COMMANDS),
    deb = debian_buster_amd64["busybox-static"],
)

container_layer(
    name = "debug-amd64",
    env = {"PATH": "$$PATH:/busybox"},
    tars = [":busybox-amd64.tar"],
)

repkg_deb(
    name = "busybox-arm64",
    script = ":repkg_busybox-static.sh",
    args = " ".join(BUSYBOX_COMMANDS),
    deb = debian_buster_arm64["busybox-static"],
)

container_layer(
    name = "debug-arm64",
    env = {"PATH": "$$PATH:/busybox"},
    tars = [":busybox-arm64.tar"],
)

repkg_deb(
    name = "busybox-arm",
    script = ":repkg_busybox-static.sh",
    args = " ".join(BUSYBOX_COMMANDS),
    deb = debian_buster_armhf["busybox-static"],
)

container_layer(
    name = "debug-arm",
    env = {"PATH": "$$PATH:/busybox"},
    tars = [":busybox-arm.tar"],
)

# qemu layer

repkg_deb(
    name = "qemu-static",
    script = "repkg_qemu-user-static.sh",
    deb = debian_buster_security_amd64["qemu-user-static"],
)

container_layer(
    name = "qemu",
    tars = [":qemu-static.tar"],
)
