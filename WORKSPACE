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

# discolix build deps

http_archive(
    name = "rules_pkg",
    sha256 = "dff10e80f2d58d4ce8434ef794e5f9ec0856f3a355ae41c6056259b65e1ad11a",
    strip_prefix = "rules_pkg-0.4.0/pkg",
    urls = ["https://github.com/bazelbuild/rules_pkg/archive/0.4.0.tar.gz"],
)

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()

http_archive(
    name = "deb_package",
    sha256 = "dff10e80f2d58d4ce8434ef794e5f9ec0856f3a355ae41c6056259b65e1ad11a",
    strip_prefix = "rules_pkg-0.4.0/deb_packages",
    urls = ["https://github.com/bazelbuild/rules_pkg/archive/0.4.0.tar.gz"],
)

http_archive(
    name = "rules_python",
    sha256 = "4feecd37ec6e9941a455a19e7392bed65003eab0aa6ea347ca431bce2640e530",
    strip_prefix = "rules_python-0.3.0",
    urls = ["https://github.com/bazelbuild/rules_python/archive/0.3.0.tar.gz"],
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "59d5b42ac315e7eadffa944e86e90c2990110a1c8075f1cd145f487e999d22b3",
    strip_prefix = "rules_docker-0.17.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.17.0/rules_docker-v0.17.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

http_archive(
    name = "com_github_emacski_bazeltools",
    sha256 = "dba9e8f0613401ed3c052d6fe79b3517197a7747046659845309fb17e9b3038d",
    strip_prefix = "bazel-tools-17a0d8b9ae66bc542853a72365ef1aeb85086827",
    urls = ["https://github.com/emacski/bazel-tools/archive/17a0d8b9ae66bc542853a72365ef1aeb85086827.tar.gz"],
)

# deb_checker utility build deps

http_archive(
    name = "com_github_grpc_grpc",
    sha256 = "f60e5b112913bf776a22c16a3053cc02cf55e60bf27a959fd54d7aaf8e2da6e8",
    strip_prefix = "grpc-1.38.1",
    urls = ["https://github.com/grpc/grpc/archive/v1.38.1.tar.gz"],
)

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()

http_archive(
    name = "bazel_buildtools",
    sha256 = "c28eef4d30ba1a195c6837acf6c75a4034981f5b4002dda3c5aa6e48ce023cf1",
    strip_prefix = "buildtools-4.0.1",
    urls = ["https://github.com/bazelbuild/buildtools/archive/4.0.1.tar.gz"],
)

load("@rules_python//python:pip.bzl", "pip_install")

pip_install(
    requirements = "//tools/deb_checker:requirements.txt",
)

# deb packages

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
        "base-files": "pool/main/b/base-files/base-files_10.3+deb10u11_amd64.deb",
        "busybox-static": "pool/main/b/busybox/busybox-static_1.30.1-4_amd64.deb",
        "dash": "pool/main/d/dash/dash_0.5.10.2-5_amd64.deb",
        "libbz2-1.0": "pool/main/b/bzip2/libbz2-1.0_1.0.6-9.2~deb10u1_amd64.deb",
        "libc6": "pool/main/g/glibc/libc6_2.28-10_amd64.deb",
        "libdb5.3": "pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.5_amd64.deb",
        "libffi6": "pool/main/libf/libffi/libffi6_3.2.1-9_amd64.deb",
        "libgcc1": "pool/main/g/gcc-8/libgcc1_8.3.0-6_amd64.deb",
        "libgomp1": "pool/main/g/gcc-8/libgomp1_8.3.0-6_amd64.deb",
        "liblzma5": "pool/main/x/xz-utils/liblzma5_5.2.4-1_amd64.deb",
        "libmpdec2": "pool/main/m/mpdecimal/libmpdec2_2.4.2-2_amd64.deb",
        "libncursesw6": "pool/main/n/ncurses/libncursesw6_6.1+20181013-2+deb10u2_amd64.deb",
        "libpython3.7-minimal": "pool/main/p/python3.7/libpython3.7-minimal_3.7.3-2+deb10u3_amd64.deb",
        "libpython3.7-stdlib": "pool/main/p/python3.7/libpython3.7-stdlib_3.7.3-2+deb10u3_amd64.deb",
        "libreadline7": "pool/main/r/readline/libreadline7_7.0-5_amd64.deb",
        "libsqlite3-0": "pool/main/s/sqlite3/libsqlite3-0_3.27.2-3+deb10u1_amd64.deb",
        "libstdc++6": "pool/main/g/gcc-8/libstdc++6_8.3.0-6_amd64.deb",
        "libtinfo6": "pool/main/n/ncurses/libtinfo6_6.1+20181013-2+deb10u2_amd64.deb",
        "libuuid1": "pool/main/u/util-linux/libuuid1_2.33.1-0.1_amd64.deb",
        "python3.7-minimal": "pool/main/p/python3.7/python3.7-minimal_3.7.3-2+deb10u3_amd64.deb",
        "zlib1g": "pool/main/z/zlib/zlib1g_1.2.11.dfsg-1_amd64.deb",
    },
    packages_sha256 = {
        "base-files": "3e144c4ca83ab5689e54ce18f4c327f7cec6025160b17bea45136c013d1b8350",
        "busybox-static": "5a5f13e56389356a73d4e4eed2156b227f8be269ce4c2dcfe291484ea2fda625",
        "dash": "e4872d9f258e76665317c94c637b4270dc1c15c9cf42da90dbfde0225c7f4564",
        "libbz2-1.0": "238193cbaa71cc5365ef2aa5ad45de8521ac38dd54f4ab53bafa7de15046fa89",
        "libc6": "6f703e27185f594f8633159d00180ea1df12d84f152261b6e88af75667195a79",
        "libdb5.3": "c7f0e9a423840731362ee52d4344c0bcf84318fbc06dad4fefe0e61d9e7062bc",
        "libffi6": "d4d748d897e8e53aa239ead23a18724a1a30085cc6ca41a8c31b3b1e1b3452f4",
        "libgcc1": "b1bb7611f3372732889d502cb1d09fe572b5fbb5288a4a8b1ed0363fecc3555a",
        "libgomp1": "909fcd28491d7ebecf44ee2e8d0269b600271b0b6d236b19f2c0469cde162d21",
        "liblzma5": "292dfe85defad3a08cca62beba85e90b0231d16345160f4a66aba96399c85859",
        "libmpdec2": "9ca85e6e2645a5e660431294320658ec7a2910d9fed90ca4e648c1211a2b844b",
        "libncursesw6": "7dffe9602586300292960f2e3cf4301acfc64a91aed6fa41ea2e719ae75788b3",
        "libpython3.7-minimal": "9135e295b3710c0c3fd3fbc1ba57e3925294bbf2d6cc27a42bd382dd905a044f",
        "libpython3.7-stdlib": "36b978fcacde4e5cddc205e32b7d5c50525fef83481144ac9ec4cc83ed9e213a",
        "libreadline7": "01e99d68427722e64c603d45f00063c303b02afb53d85c8d1476deca70db64c6",
        "libsqlite3-0": "19268b796e62f754400c67c69cb759220089cf10aaa5dfd72a84ab1a818caa08",
        "libstdc++6": "5cc70625329655ff9382580971d4616db8aa39af958b7c995ee84598f142a4ee",
        "libtinfo6": "7f39c7a7b02c3373a427aa276830a6e1e0c4cc003371f34e2e50e9992aa70e1a",
        "libuuid1": "90b90bef4593d4f347fb1e74a63c5609daa86d4c5003b14e85f58628d6c118b2",
        "python3.7-minimal": "496a2fff86a2433e26b4c0736ea762426dee1eb0b7578951e0d3392aa6e242b4",
        "zlib1g": "61bc9085aadd3007433ce6f560a08446a3d3ceb0b5e061db3fc62c42fbfe3eff",
    },
    pgp_key = "buster_archive_key",
)

deb_packages(
    name = "debian_buster_security_amd64",
    arch = "amd64",
    distro = "buster/updates",
    distro_type = "debian",
    mirrors = ["http://security.debian.org/debian-security"],
    packages = {
        "libexpat1": "pool/updates/main/e/expat/libexpat1_2.2.6-2+deb10u1_amd64.deb",
        "libssl1.1": "pool/updates/main/o/openssl/libssl1.1_1.1.1d-0+deb10u7_amd64.deb",
        "openssl": "pool/updates/main/o/openssl/openssl_1.1.1d-0+deb10u7_amd64.deb",
        "qemu-user-static": "pool/updates/main/q/qemu/qemu-user-static_3.1+dfsg-8+deb10u8_amd64.deb",
    },
    packages_sha256 = {
        "libexpat1": "d60dee1f402ee0fba6d44df584512ae9ede73e866048e8476de55d9b78fa2da1",
        "libssl1.1": "49e1171928d3930fb8ba5659a80e8862d7d585c6d750acb6520b1c133ac00b29",
        "openssl": "eb2c128d1b378547bab986c7024bc297573a4ac6f180d2b44465b6ad5b432284",
        "qemu-user-static": "34d01a0ff83d44fe4f39e35c7f86346f5e5afa3731ce7623a12688b194ea8ca3",
    },
    pgp_key = "buster_archive_security_key",
)

deb_packages(
    name = "debian_buster_arm64",
    arch = "arm64",
    distro = "buster",
    distro_type = "debian",
    mirrors = ["http://deb.debian.org/debian"],
    packages = {
        "base-files": "pool/main/b/base-files/base-files_10.3+deb10u11_arm64.deb",
        "busybox-static": "pool/main/b/busybox/busybox-static_1.30.1-4_arm64.deb",
        "dash": "pool/main/d/dash/dash_0.5.10.2-5_arm64.deb",
        "libbz2-1.0": "pool/main/b/bzip2/libbz2-1.0_1.0.6-9.2~deb10u1_arm64.deb",
        "libc6": "pool/main/g/glibc/libc6_2.28-10_arm64.deb",
        "libdb5.3": "pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.5_arm64.deb",
        "libffi6": "pool/main/libf/libffi/libffi6_3.2.1-9_arm64.deb",
        "libgcc1": "pool/main/g/gcc-8/libgcc1_8.3.0-6_arm64.deb",
        "libgomp1": "pool/main/g/gcc-8/libgomp1_8.3.0-6_arm64.deb",
        "liblzma5": "pool/main/x/xz-utils/liblzma5_5.2.4-1_arm64.deb",
        "libmpdec2": "pool/main/m/mpdecimal/libmpdec2_2.4.2-2_arm64.deb",
        "libncursesw6": "pool/main/n/ncurses/libncursesw6_6.1+20181013-2+deb10u2_arm64.deb",
        "libpython3.7-minimal": "pool/main/p/python3.7/libpython3.7-minimal_3.7.3-2+deb10u3_arm64.deb",
        "libpython3.7-stdlib": "pool/main/p/python3.7/libpython3.7-stdlib_3.7.3-2+deb10u3_arm64.deb",
        "libreadline7": "pool/main/r/readline/libreadline7_7.0-5_arm64.deb",
        "libsqlite3-0": "pool/main/s/sqlite3/libsqlite3-0_3.27.2-3+deb10u1_arm64.deb",
        "libstdc++6": "pool/main/g/gcc-8/libstdc++6_8.3.0-6_arm64.deb",
        "libtinfo6": "pool/main/n/ncurses/libtinfo6_6.1+20181013-2+deb10u2_arm64.deb",
        "libuuid1": "pool/main/u/util-linux/libuuid1_2.33.1-0.1_arm64.deb",
        "python3.7-minimal": "pool/main/p/python3.7/python3.7-minimal_3.7.3-2+deb10u3_arm64.deb",
        "zlib1g": "pool/main/z/zlib/zlib1g_1.2.11.dfsg-1_arm64.deb",
    },
    packages_sha256 = {
        "base-files": "e8f46bcbccd2f0123a7492dd9a70922e40cd69dd0aae508eaedbc5b82131f3b2",
        "busybox-static": "253b6111898747d64c20aa255c20f5d1bbd3e9547e38bb12a550cd1ca5793e36",
        "dash": "63d948ae0479c25652798cb072ecb4a24ab281cda477224773f033b570760058",
        "libbz2-1.0": "759f72ebadc1c8a790a1260c29d40736d0ebc2ee1a4e003ea70704631b42614e",
        "libc6": "80f98b3c20ef093d9bdd88c150cf3d6467209d4d3b1f61abbe8379de2680a08d",
        "libdb5.3": "d2086e5495ea348d0bf5118ca427fcd22fcd1b9390d3938d90d71ab98d667050",
        "libffi6": "c5f7f4158dc6821bf37dd44ce0fe4399b5798d4ae7e821ad85b63059a2b31c0f",
        "libgcc1": "2851ac25d12958586c035de5ec4f2fc17272dec48f776dd0dd24c62f62674fd9",
        "libgomp1": "a147bccae845e5405941df3f761065cbc68f06bb29fccb46bfce7dff562cc0fa",
        "liblzma5": "a0e05b73ef039aac46b5d1ddab5c35e60561424238152e363e7319958dd4b814",
        "libmpdec2": "72638348c7faeccd51d75e7bba75748c319a2240734e3577a06d9d0e210a7c35",
        "libncursesw6": "da4dc6c68aecff023f614ce84355291486b72068e6e0bf7b27d16b78361b162b",
        "libpython3.7-minimal": "3894a25b00365d0064a6213e6fb2fc78411279a36e95b1ce818b82c064c32865",
        "libpython3.7-stdlib": "5e3cacad793d30615ff9df3ad1b7baee5eeb16556cd37ebbd9c90d991bd9aa19",
        "libreadline7": "2c11b5542b1d9ef224fccb08e0c3e6a1b27e083320aede9620822f60a161e1f7",
        "libsqlite3-0": "986a89ba0b20c24925c7dbeeafeb1fdc6d696971e060a15fb1abd150821d9cf0",
        "libstdc++6": "52cf36333a405867a079a695f6a37cb63558859d7d19cef40fc7d112c39fefd6",
        "libtinfo6": "1b0533fcee638b5c76a07fb6ce3a64e6cb67d5e81574d6541486c0b2130430d5",
        "libuuid1": "28d3a69bae1bdc9185e70d97214773a563a7f8a72682b2deef394a4f7c9c79b8",
        "python3.7-minimal": "4c11c7291857e0a3bbc9017e6bdc0e061e09373b1587ec0d62202607a1f3675f",
        "zlib1g": "1fa65d3ae86bf52d86ad523520d0d88711ec351b5f75be1bfe477bbaf48d3f42",
    },
    pgp_key = "buster_archive_key",
)

deb_packages(
    name = "debian_buster_security_arm64",
    arch = "arm64",
    distro = "buster/updates",
    distro_type = "debian",
    mirrors = ["http://security.debian.org/debian-security"],
    packages = {
        "libexpat1": "pool/updates/main/e/expat/libexpat1_2.2.6-2+deb10u1_arm64.deb",
        "libssl1.1": "pool/updates/main/o/openssl/libssl1.1_1.1.1d-0+deb10u7_arm64.deb",
        "openssl": "pool/updates/main/o/openssl/openssl_1.1.1d-0+deb10u7_arm64.deb",
    },
    packages_sha256 = {
        "libexpat1": "6d2a44169cd76b24828553f9e6364a5b92b4c1f5ae0e2d0ed2291a5512ee01e4",
        "libssl1.1": "ead37f88ace90ecb77fdbbc058dc90272b721c5d0c6120f6782ed2e123b0f828",
        "openssl": "d5c72cb5dd59472519dc26aead40fc41026b2de453d4a8464061cb7aeaba126c",
    },
    pgp_key = "buster_archive_security_key",
)

deb_packages(
    name = "debian_buster_armhf",
    arch = "armhf",
    distro = "buster",
    distro_type = "debian",
    mirrors = ["http://deb.debian.org/debian"],
    packages = {
        "base-files": "pool/main/b/base-files/base-files_10.3+deb10u11_armhf.deb",
        "busybox-static": "pool/main/b/busybox/busybox-static_1.30.1-4_armhf.deb",
        "dash": "pool/main/d/dash/dash_0.5.10.2-5_armhf.deb",
        "libbz2-1.0": "pool/main/b/bzip2/libbz2-1.0_1.0.6-9.2~deb10u1_armhf.deb",
        "libc6": "pool/main/g/glibc/libc6_2.28-10_armhf.deb",
        "libdb5.3": "pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.5_armhf.deb",
        "libffi6": "pool/main/libf/libffi/libffi6_3.2.1-9_armhf.deb",
        "libgcc1": "pool/main/g/gcc-8/libgcc1_8.3.0-6_armhf.deb",
        "libgomp1": "pool/main/g/gcc-8/libgomp1_8.3.0-6_armhf.deb",
        "liblzma5": "pool/main/x/xz-utils/liblzma5_5.2.4-1_armhf.deb",
        "libmpdec2": "pool/main/m/mpdecimal/libmpdec2_2.4.2-2_armhf.deb",
        "libncursesw6": "pool/main/n/ncurses/libncursesw6_6.1+20181013-2+deb10u2_armhf.deb",
        "libpython3.7-minimal": "pool/main/p/python3.7/libpython3.7-minimal_3.7.3-2+deb10u3_armhf.deb",
        "libpython3.7-stdlib": "pool/main/p/python3.7/libpython3.7-stdlib_3.7.3-2+deb10u3_armhf.deb",
        "libreadline7": "pool/main/r/readline/libreadline7_7.0-5_armhf.deb",
        "libsqlite3-0": "pool/main/s/sqlite3/libsqlite3-0_3.27.2-3+deb10u1_armhf.deb",
        "libstdc++6": "pool/main/g/gcc-8/libstdc++6_8.3.0-6_armhf.deb",
        "libtinfo6": "pool/main/n/ncurses/libtinfo6_6.1+20181013-2+deb10u2_armhf.deb",
        "libuuid1": "pool/main/u/util-linux/libuuid1_2.33.1-0.1_armhf.deb",
        "python3.7-minimal": "pool/main/p/python3.7/python3.7-minimal_3.7.3-2+deb10u3_armhf.deb",
        "zlib1g": "pool/main/z/zlib/zlib1g_1.2.11.dfsg-1_armhf.deb",
    },
    packages_sha256 = {
        "base-files": "f1b94a9e5a52318b353d1416b9ac3823accab2ee3a49e7eaeae9e75da7971e9a",
        "busybox-static": "ea1ee96420013d8404d677a81c92eb54adbf58852ffaa6722a39245025157304",
        "dash": "4287aa31a5c1d9e32f077e90194b37f5d9af326630248c4a3df83c5d3965f219",
        "libbz2-1.0": "4401482dad1f11e370b0d47078b0eef74593d3b12badd8d4277a1c448ab2de15",
        "libc6": "53808a0c23b22a7b110a67c203b6d163b97045b8a440e30369ea33bcd452346d",
        "libdb5.3": "d34c3f927b13c17550313dd314cb064b66846279afd032574bff16aab62f0697",
        "libffi6": "420723ea7f56f2e9dfa20f683117a9e6f5ec9336b88c3ef5a7f69622ab815872",
        "libgcc1": "2303bab1cc54099a8de5ced6601c10d4abedc62d3c12addc097f03cba1355d2d",
        "libgomp1": "0ee637d20d92fb217def838cf7a0591f05384dced5f5ec9885f93b61931f1522",
        "liblzma5": "07d901230e1fafd740ce2f26e7bf9e564ff6669c269841d6fa48ccbf997e2547",
        "libmpdec2": "ec441279854d5bacc0e5eec5601040bbd20e10999ac0ac13d768c5db3885cd59",
        "libncursesw6": "984cd005ad6edf2792f383973d4f8d9bb3aae81ebd35287b62806faf37bf222a",
        "libpython3.7-minimal": "4c8187142ebcc136754c1005bba4683e409db4c2345e0baf468845ea2fe7af46",
        "libpython3.7-stdlib": "1e455341f084a06d519fcc299250a774acd06f7764fef543bd6ac0337d17dad8",
        "libreadline7": "de3aa01b6ecfa5b57e5011e400abddf9174056588c21b42189b497e65a67d983",
        "libsqlite3-0": "f35d1f408b1ef9e6c0cbb2d5989f60f06faa07536a9b0ffd5c07f3b2be2eb301",
        "libstdc++6": "2a22648689ca745554599a818f01241605b2548540d62026116cb07a15df8d09",
        "libtinfo6": "5bb6e9c2dab2309dcd0f0d9d9990f21404032c1082a9bd2b127e13e085592f72",
        "libuuid1": "4bde8f620a8a1e818223ed702478afa836d5bb119a4750bc6795ab67b8cb3589",
        "python3.7-minimal": "72f7d5e850777152cf689ddf8337ba6a3c979a20914e6b09e9309a31b6365a73",
        "zlib1g": "c4e5a709233034080b5f8ec7b73c83f26fc8e921326e926aef4a22a6d07415ac",
    },
    pgp_key = "buster_archive_key",
)

deb_packages(
    name = "debian_buster_security_armhf",
    arch = "armhf",
    distro = "buster/updates",
    distro_type = "debian",
    mirrors = ["http://security.debian.org/debian-security"],
    packages = {
        "libexpat1": "pool/updates/main/e/expat/libexpat1_2.2.6-2+deb10u1_armhf.deb",
        "libssl1.1": "pool/updates/main/o/openssl/libssl1.1_1.1.1d-0+deb10u7_armhf.deb",
        "openssl": "pool/updates/main/o/openssl/openssl_1.1.1d-0+deb10u7_armhf.deb",
    },
    packages_sha256 = {
        "libexpat1": "8ada16a8a8f5d96eb2dcd89de63d91e7983141ef957cdc71d34ef744f0c9b7d2",
        "libssl1.1": "718e6ff28f467222ec63fd21fd36d86ed12fe98e4389c7cea34435276a3907b7",
        "openssl": "b15518f74b8769b0629e60efb484a842fb3af61772ac03890be1e8d5e9b18f95",
    },
    pgp_key = "buster_archive_security_key",
)

deb_packages(
    name = "debian_buster_noarch",
    arch = "all",
    distro = "buster",
    distro_type = "debian",
    mirrors = ["http://deb.debian.org/debian"],
    packages = {
        "ca-certificates": "pool/main/c/ca-certificates/ca-certificates_20200601~deb10u2_all.deb",
        "mime-support": "pool/main/m/mime-support/mime-support_3.62_all.deb",
        "netbase": "pool/main/n/netbase/netbase_5.6_all.deb",
        "python-pip-whl": "pool/main/p/python-pip/python-pip-whl_18.1-5_all.deb",
        "python3-distutils": "pool/main/p/python3-stdlib-extensions/python3-distutils_3.7.3-1_all.deb",
        "python3-lib2to3": "pool/main/p/python3-stdlib-extensions/python3-lib2to3_3.7.3-1_all.deb",
        "python3-pip": "pool/main/p/python-pip/python3-pip_18.1-5_all.deb",
        "python3-pkg-resources": "pool/main/p/python-setuptools/python3-pkg-resources_40.8.0-1_all.deb",
        "python3-setuptools": "pool/main/p/python-setuptools/python3-setuptools_40.8.0-1_all.deb",
        "readline-common": "pool/main/r/readline/readline-common_7.0-5_all.deb",
        "tzdata": "pool/main/t/tzdata/tzdata_2021a-0+deb10u2_all.deb",
    },
    packages_sha256 = {
        "ca-certificates": "a9e267a24088c793a9cf782455fd344db5fdced714f112a8857c5bfd07179387",
        "mime-support": "776efd686af26fa26325450280e3305463b1faef75d82b383bb00da61893d8ca",
        "netbase": "baf0872964df0ccb10e464b47d995acbba5a0d12a97afe2646d9a6bb97e8d79d",
        "python-pip-whl": "ce2afe34ddd9382df12f3e3964a5387a146a1d34137210fa5eb813301a62bed3",
        "python3-distutils": "6918af11061d3141990e78f5ad0530ec0f9a188cac27113d9de2896203efc13f",
        "python3-lib2to3": "227e2a2d12922c00dee9e55d8c5b889cfc5e72a54b85c2a509fa1664c2e9e137",
        "python3-pip": "b1b7a1cdcef0d9c98bd07f32c0573f5045a2d73ee172cb22635523d86318c35a",
        "python3-pkg-resources": "43783cd63c996b36fcf29bfd8be8c44666148c9129ade88985876d7f9c0bf2f6",
        "python3-setuptools": "cd4967dbdfbb59ca451c0717aedda9ed44b63d565d1eda661c12603ac7d44fb6",
        "readline-common": "153d8a5ddb04044d10f877a8955d944612ec9035f4c73eec99d85a92c3816712",
        "tzdata": "df0982c75ccefa2268e77b0c2baba1dd2440bb2a03a9f1fcecebc2f6fce9171f",
    },
    pgp_key = "buster_archive_key",
)

deb_packages(
    name = "debian_buster_security_noarch",
    arch = "all",
    distro = "buster/updates",
    distro_type = "debian",
    mirrors = ["http://security.debian.org/debian-security"],
    packages = {},
    packages_sha256 = {},
    pgp_key = "buster_archive_security_key",
)
