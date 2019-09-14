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

load("@debian_buster_amd64//debs:deb_packages.bzl", "debian_buster_amd64")
load("@debian_buster_arm64//debs:deb_packages.bzl", "debian_buster_arm64")
load("@debian_buster_armhf//debs:deb_packages.bzl", "debian_buster_armhf")
load("@debian_buster_noarch//debs:deb_packages.bzl", "debian_buster_noarch")
load("@debian_buster_security_amd64//debs:deb_packages.bzl", "debian_buster_security_amd64")
load("@debian_buster_security_arm64//debs:deb_packages.bzl", "debian_buster_security_arm64")
load("@debian_buster_security_armhf//debs:deb_packages.bzl", "debian_buster_security_armhf")
load("@debian_buster_security_noarch//debs:deb_packages.bzl", "debian_buster_security_noarch")

debian_buster = {
    "amd64": debian_buster_amd64,
    "arm64": debian_buster_arm64,
    "arm": debian_buster_armhf,
    "noarch": debian_buster_noarch,
}

debian_buster_security = {
    "amd64": debian_buster_security_amd64,
    "arm64": debian_buster_security_arm64,
    "arm": debian_buster_security_armhf,
    "noarch": debian_buster_security_noarch,
}
