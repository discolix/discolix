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

workspace(name = "com_github_discolix_discolix")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

# download the rules_go repository to add support for building go projects
# https://github.com/bazelbuild/rules_go
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "313f2c7a23fecc33023563f082f381a32b9b7254f727a7dd2d6380ccc6dfe09b",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/0.19.3/rules_go-0.19.3.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/0.19.3/rules_go-0.19.3.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

# download the rules_docker repository to add support for building docker images
# https://github.com/bazelbuild/rules_docker
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "e513c0ac6534810eb7a14bf025a0f159726753f97f74ab7863c650d26e01d677",
    strip_prefix = "rules_docker-0.9.0",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.9.0.tar.gz"],
)

load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repos = "repositories")

container_repos()

load("@io_bazel_rules_docker//repositories:go_repositories.bzl", container_go_deps = "go_deps")

container_go_deps()

# download rules for packaging files in different formats
# https://github.com/bazelbuild/rules_pkg
http_archive(
    name = "rules_pkg",
    sha256 = "80a6d8a9a05d95ac9f969503708d3c6369815e3170c6b60e03c32faa9c2d77ab",
    strip_prefix = "rules_pkg-0.2.1/pkg",
    urls = ["https://github.com/bazelbuild/rules_pkg/archive/0.2.1.tar.gz"],
)

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()

# download workspace rules and utilities for managing deb pkgs
# https://github.com/bazelbuild/rules_pkg
http_archive(
    name = "deb_package",
    sha256 = "80a6d8a9a05d95ac9f969503708d3c6369815e3170c6b60e03c32faa9c2d77ab",
    strip_prefix = "rules_pkg-0.2.1/deb_packages",
    urls = ["https://github.com/bazelbuild/rules_pkg/archive/0.2.1.tar.gz"],
)

load("//private:deb_package_repo_helper.bzl", "update_deb_package_repos")

update_deb_package_repos()

load("//private:deb_package_helper.bzl", "update_deb_package_dependencies")

update_deb_package_dependencies()

http_file(
    name = "buster_archive_key",
    sha256 = "9c854992fc6c423efe8622c3c326a66e73268995ecbe8f685129063206a18043",
    urls = ["https://ftp-master.debian.org/keys/archive-key-10.asc"],
)

http_file(
    name = "buster_archive_security_key",
    sha256 = "4cf886d6df0fc1c185ce9fb085d1cd8d678bc460e6267d80a833d7ea507a0fbd",
    urls = ["https://ftp-master.debian.org/keys/archive-key-10-security.asc"],
)

load("@deb_package//:deb_packages.bzl", "deb_packages")

deb_packages(
    name = "debian_buster_amd64",
    arch = "amd64",
    distro = "buster",
    distro_type = "debian",
    mirrors = ["http://deb.debian.org/debian"],
    packages = {
        "base-files": "pool/main/b/base-files/base-files_10.3_amd64.deb",
        "busybox-static": "pool/main/b/busybox/busybox-static_1.30.1-4_amd64.deb",
        "libc6": "pool/main/g/glibc/libc6_2.28-10_amd64.deb",
        "libgcc1": "pool/main/g/gcc-8/libgcc1_8.3.0-6_amd64.deb",
        "libgomp1": "pool/main/g/gcc-8/libgomp1_8.3.0-6_amd64.deb",
        "libssl1.1": "pool/main/o/openssl/libssl1.1_1.1.1c-1_amd64.deb",
        "libstdc++6": "pool/main/g/gcc-8/libstdc++6_8.3.0-6_amd64.deb",
        "openssl": "pool/main/o/openssl/openssl_1.1.1c-1_amd64.deb",
        "qemu-user-static": "pool/main/q/qemu/qemu-user-static_3.1+dfsg-8~deb10u1_amd64.deb",
    },
    packages_sha256 = {
        "base-files": "5977cc7871804dbb0a80de78064df351fc26a808c54d224ce543e695b92c9cab",
        "busybox-static": "5a5f13e56389356a73d4e4eed2156b227f8be269ce4c2dcfe291484ea2fda625",
        "libc6": "6f703e27185f594f8633159d00180ea1df12d84f152261b6e88af75667195a79",
        "libgcc1": "b1bb7611f3372732889d502cb1d09fe572b5fbb5288a4a8b1ed0363fecc3555a",
        "libgomp1": "909fcd28491d7ebecf44ee2e8d0269b600271b0b6d236b19f2c0469cde162d21",
        "libssl1.1": "e3653d4087f856eb3822f9b67c44ff5b3042df561d4123856d8796d4a993b50a",
        "libstdc++6": "5cc70625329655ff9382580971d4616db8aa39af958b7c995ee84598f142a4ee",
        "openssl": "1f77d5e8603adeec405a2dfe468dee7c70028ed1ebcf1c39ea304ed2608b6236",
        "qemu-user-static": "244d9e69509bb9930716d7bb0873c1bd1afcd7cba62161a49ca0b6d99c93bec2",
    },
    pgp_key = "buster_archive_key",
)

deb_packages(
    name = "debian_buster_arm64",
    arch = "arm64",
    distro = "buster",
    distro_type = "debian",
    mirrors = ["http://deb.debian.org/debian"],
    packages = {
        "base-files": "pool/main/b/base-files/base-files_10.3_arm64.deb",
        "busybox-static": "pool/main/b/busybox/busybox-static_1.30.1-4_arm64.deb",
        "libc6": "pool/main/g/glibc/libc6_2.28-10_arm64.deb",
        "libgcc1": "pool/main/g/gcc-8/libgcc1_8.3.0-6_arm64.deb",
        "libgomp1": "pool/main/g/gcc-8/libgomp1_8.3.0-6_arm64.deb",
        "libssl1.1": "pool/main/o/openssl/libssl1.1_1.1.1c-1_arm64.deb",
        "libstdc++6": "pool/main/g/gcc-8/libstdc++6_8.3.0-6_arm64.deb",
        "openssl": "pool/main/o/openssl/openssl_1.1.1c-1_arm64.deb",
    },
    packages_sha256 = {
        "base-files": "96d164b973b10ee2d70052eaa394518ca337e640a992725adff41e6676636d35",
        "busybox-static": "253b6111898747d64c20aa255c20f5d1bbd3e9547e38bb12a550cd1ca5793e36",
        "libc6": "80f98b3c20ef093d9bdd88c150cf3d6467209d4d3b1f61abbe8379de2680a08d",
        "libgcc1": "2851ac25d12958586c035de5ec4f2fc17272dec48f776dd0dd24c62f62674fd9",
        "libgomp1": "a147bccae845e5405941df3f761065cbc68f06bb29fccb46bfce7dff562cc0fa",
        "libssl1.1": "1f78d1c1c1bef2486a3c7539cd30109ffa9d0e2dc959956c2abf64054d20a05c",
        "libstdc++6": "52cf36333a405867a079a695f6a37cb63558859d7d19cef40fc7d112c39fefd6",
        "openssl": "d799ccc7c9db6ee3276f46db1371d20747e5e14a2c2628d3b6b8d1f206702a96",
    },
    pgp_key = "buster_archive_key",
)

deb_packages(
    name = "debian_buster_armhf",
    arch = "armhf",
    distro = "buster",
    distro_type = "debian",
    mirrors = ["http://deb.debian.org/debian"],
    packages = {
        "base-files": "pool/main/b/base-files/base-files_10.3_armhf.deb",
        "busybox-static": "pool/main/b/busybox/busybox-static_1.30.1-4_armhf.deb",
        "libc6": "pool/main/g/glibc/libc6_2.28-10_armhf.deb",
        "libgcc1": "pool/main/g/gcc-8/libgcc1_8.3.0-6_armhf.deb",
        "libgomp1": "pool/main/g/gcc-8/libgomp1_8.3.0-6_armhf.deb",
        "libssl1.1": "pool/main/o/openssl/libssl1.1_1.1.1c-1_armhf.deb",
        "libstdc++6": "pool/main/g/gcc-8/libstdc++6_8.3.0-6_armhf.deb",
        "openssl": "pool/main/o/openssl/openssl_1.1.1c-1_armhf.deb",
    },
    packages_sha256 = {
        "base-files": "1052d1a1f5345a6a0328a3d2344c2be61e30b0d885dc65d7c2bf4905a8528a52",
        "busybox-static": "ea1ee96420013d8404d677a81c92eb54adbf58852ffaa6722a39245025157304",
        "libc6": "53808a0c23b22a7b110a67c203b6d163b97045b8a440e30369ea33bcd452346d",
        "libgcc1": "2303bab1cc54099a8de5ced6601c10d4abedc62d3c12addc097f03cba1355d2d",
        "libgomp1": "0ee637d20d92fb217def838cf7a0591f05384dced5f5ec9885f93b61931f1522",
        "libssl1.1": "ac2670eaef28d322237dd1ff8fe2f08d36ccbe2e9893165ff27a0715387647ad",
        "libstdc++6": "2a22648689ca745554599a818f01241605b2548540d62026116cb07a15df8d09",
        "openssl": "2e5d8e0d8a28626bc4717065abe0ee3ab39ec4a0ea4dd273e56a6f142c757f8f",
    },
    pgp_key = "buster_archive_key",
)

deb_packages(
    name = "debian_buster_noarch",
    arch = "armhf",
    distro = "buster",
    distro_type = "debian",
    mirrors = ["http://deb.debian.org/debian"],
    packages = {
        "ca-certificates": "pool/main/c/ca-certificates/ca-certificates_20190110_all.deb",
        "netbase": "pool/main/n/netbase/netbase_5.6_all.deb",
        "tzdata": "pool/main/t/tzdata/tzdata_2019a-1_all.deb",
    },
    packages_sha256 = {
        "ca-certificates": "f55f88c8cc8fe014fa931fa22eae763fb12771e2b2a04a07bba5e4fdf3a3da6c",
        "netbase": "baf0872964df0ccb10e464b47d995acbba5a0d12a97afe2646d9a6bb97e8d79d",
        "tzdata": "588428382706ffc62bfc26cbd22376e3696735fad21e8f0d4ec189a55aea90d1",
    },
    pgp_key = "buster_archive_key",
)
