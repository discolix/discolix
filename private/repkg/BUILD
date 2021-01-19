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

load("@com_github_emacski_bazeltools//repkg:defs.bzl", "repkg_debs")
load("//private:debian_buster.bzl", "debian_buster", "debian_buster_security")
load("//private:platforms.bzl", "PLATFORMS")
load(":busybox_commands.bzl", "BUSYBOX_COMMANDS")

package(default_visibility = ["//:discolix_all"])

# ca-certificates

repkg_debs(
    name = "ca-certificates",
    debs = [debian_buster["noarch"]["ca-certificates"]],
    script = ":repkg_ca-certificates.sh",
)

# busybox-static

[repkg_debs(
    name = "busybox-static-" + arch,
    args = " ".join(BUSYBOX_COMMANDS),
    debs = [debian_buster[arch]["busybox-static"]],
    script = ":repkg_busybox-static.sh",
) for (platform, os, arch) in PLATFORMS]

# qemu-static

repkg_debs(
    name = "qemu-static",
    debs = [debian_buster_security["amd64"]["qemu-user-static"]],
    script = "repkg_qemu-user-static.sh",
)
