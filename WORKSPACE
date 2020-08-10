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

# rules_pkg
# https://github.com/bazelbuild/rules_pkg
http_archive(
    name = "rules_pkg",
    sha256 = "b9d1387deed06eef45edd3eb7fd166577b8ad1884cb6a17898d136059d03933c",
    strip_prefix = "rules_pkg-0.2.6-1/pkg",
    urls = ["https://github.com/bazelbuild/rules_pkg/archive/0.2.6-1.tar.gz"],
)

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")
rules_pkg_dependencies()

# deb_package
# https://github.com/bazelbuild/rules_pkg
http_archive(
    name = "deb_package",
    sha256 = "b9d1387deed06eef45edd3eb7fd166577b8ad1884cb6a17898d136059d03933c",
    strip_prefix = "rules_pkg-0.2.6-1/deb_packages",
    urls = ["https://github.com/bazelbuild/rules_pkg/archive/0.2.6-1.tar.gz"],
)

# rules_docker
# https://github.com/bazelbuild/rules_docker
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "4521794f0fba2e20f3bf15846ab5e01d5332e587e9ce81629c7f96c793bb7036",
    strip_prefix = "rules_docker-0.14.4",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.14.4/rules_docker-v0.14.4.tar.gz"],
)

load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repos = "repositories")
container_repos()
load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")
container_deps()
load("@io_bazel_rules_docker//repositories:pip_repositories.bzl", "pip_deps")
pip_deps()

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
        "base-files": "pool/main/b/base-files/base-files_10.3+deb10u5_amd64.deb",
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
        "libpython3.7-minimal": "pool/main/p/python3.7/libpython3.7-minimal_3.7.3-2+deb10u2_amd64.deb",
        "libpython3.7-stdlib": "pool/main/p/python3.7/libpython3.7-stdlib_3.7.3-2+deb10u2_amd64.deb",
        "libreadline7": "pool/main/r/readline/libreadline7_7.0-5_amd64.deb",
        "libsqlite3-0": "pool/main/s/sqlite3/libsqlite3-0_3.27.2-3_amd64.deb",
        "libstdc++6": "pool/main/g/gcc-8/libstdc++6_8.3.0-6_amd64.deb",
        "libtinfo6": "pool/main/n/ncurses/libtinfo6_6.1+20181013-2+deb10u2_amd64.deb",
        "libuuid1": "pool/main/u/util-linux/libuuid1_2.33.1-0.1_amd64.deb",
        "python3.7-minimal": "pool/main/p/python3.7/python3.7-minimal_3.7.3-2+deb10u2_amd64.deb",
        "zlib1g": "pool/main/z/zlib/zlib1g_1.2.11.dfsg-1_amd64.deb",
    },
    packages_sha256 = {
        "base-files": "55fed931dfbe40570ff98d42c4ecf38a17837415c14bd9c835aad302b8d29a7f",
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
        "libpython3.7-minimal": "783822ae63e3bbdadeabfc8121fc920652248acf9de6be9b1bb42d2a4a0baaf1",
        "libpython3.7-stdlib": "bfa1a449fcd229456f73b6fb6af24aeb9ad3d6b998b650b7e5615b8101e5d3c0",
        "libreadline7": "01e99d68427722e64c603d45f00063c303b02afb53d85c8d1476deca70db64c6",
        "libsqlite3-0": "ff247b1c0527cc7322af8d47260268db079e94284ee12352b31be912d30ce2a1",
        "libstdc++6": "5cc70625329655ff9382580971d4616db8aa39af958b7c995ee84598f142a4ee",
        "libtinfo6": "7f39c7a7b02c3373a427aa276830a6e1e0c4cc003371f34e2e50e9992aa70e1a",
        "libuuid1": "90b90bef4593d4f347fb1e74a63c5609daa86d4c5003b14e85f58628d6c118b2",
        "python3.7-minimal": "c3f234591469e8fc3eaac9cb6a20732b10e4392d29cf8c743216c6ea841a2133",
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
        "libssl1.1": "pool/updates/main/o/openssl/libssl1.1_1.1.1d-0+deb10u3_amd64.deb",
        "openssl": "pool/updates/main/o/openssl/openssl_1.1.1d-0+deb10u3_amd64.deb",
        "qemu-user-static": "pool/updates/main/q/qemu/qemu-user-static_3.1+dfsg-8+deb10u7_amd64.deb",
    },
    packages_sha256 = {
        "libexpat1": "d60dee1f402ee0fba6d44df584512ae9ede73e866048e8476de55d9b78fa2da1",
        "libssl1.1": "b293309a892730986e779aea48e97ea94cd58f34f07fefbd432c210ee4a427e2",
        "openssl": "03a133833154325c731291c8a87daef5962dcfb75dee7cdb11f7fb923de2db82",
        "qemu-user-static": "7e934fb0dad5cd0811cc509586cd4bfb02198ecf1cf2b64160bf7f41d481bb58",
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
        "base-files": "pool/main/b/base-files/base-files_10.3+deb10u5_arm64.deb",
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
        "libpython3.7-minimal": "pool/main/p/python3.7/libpython3.7-minimal_3.7.3-2+deb10u2_arm64.deb",
        "libpython3.7-stdlib": "pool/main/p/python3.7/libpython3.7-stdlib_3.7.3-2+deb10u2_arm64.deb",
        "libreadline7": "pool/main/r/readline/libreadline7_7.0-5_arm64.deb",
        "libsqlite3-0": "pool/main/s/sqlite3/libsqlite3-0_3.27.2-3_arm64.deb",
        "libstdc++6": "pool/main/g/gcc-8/libstdc++6_8.3.0-6_arm64.deb",
        "libtinfo6": "pool/main/n/ncurses/libtinfo6_6.1+20181013-2+deb10u2_arm64.deb",
        "libuuid1": "pool/main/u/util-linux/libuuid1_2.33.1-0.1_arm64.deb",
        "python3.7-minimal": "pool/main/p/python3.7/python3.7-minimal_3.7.3-2+deb10u2_arm64.deb",
        "zlib1g": "pool/main/z/zlib/zlib1g_1.2.11.dfsg-1_arm64.deb",
    },
    packages_sha256 = {
        "base-files": "e7a638aa2701135270d64abb64ae70d02961ded465080d68dad5fe5d991f2d49",
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
        "libpython3.7-minimal": "7d4c77832782994d10789d7304a43835e856b84ec927be4c21b4bd60b519207f",
        "libpython3.7-stdlib": "537b1467794d24fc691d849480447bf2527ca33de05f20da47119668ed54cb53",
        "libreadline7": "2c11b5542b1d9ef224fccb08e0c3e6a1b27e083320aede9620822f60a161e1f7",
        "libsqlite3-0": "dc640195d3a2958f04f78b3bc8835ea0ca0105c12c179571555616b3b4e4a59f",
        "libstdc++6": "52cf36333a405867a079a695f6a37cb63558859d7d19cef40fc7d112c39fefd6",
        "libtinfo6": "1b0533fcee638b5c76a07fb6ce3a64e6cb67d5e81574d6541486c0b2130430d5",
        "libuuid1": "28d3a69bae1bdc9185e70d97214773a563a7f8a72682b2deef394a4f7c9c79b8",
        "python3.7-minimal": "64410f0ccd912a319cf8211ee18a0c2cb1341e50e98f0eb4b3da1ea161b99e77",
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
        "libssl1.1": "pool/updates/main/o/openssl/libssl1.1_1.1.1d-0+deb10u3_arm64.deb",
        "openssl": "pool/updates/main/o/openssl/openssl_1.1.1d-0+deb10u3_arm64.deb",
    },
    packages_sha256 = {
        "libexpat1": "6d2a44169cd76b24828553f9e6364a5b92b4c1f5ae0e2d0ed2291a5512ee01e4",
        "libssl1.1": "e9ce1e4744927ce5ef3e9a556c280452d83eee51145d6f6771160197415c5f71",
        "openssl": "47eabb66134a1b73bbbe9352f711caa45df67bbf7f260696675082c4f3bac72f",
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
        "base-files": "pool/main/b/base-files/base-files_10.3+deb10u5_armhf.deb",
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
        "libpython3.7-minimal": "pool/main/p/python3.7/libpython3.7-minimal_3.7.3-2+deb10u2_armhf.deb",
        "libpython3.7-stdlib": "pool/main/p/python3.7/libpython3.7-stdlib_3.7.3-2+deb10u2_armhf.deb",
        "libreadline7": "pool/main/r/readline/libreadline7_7.0-5_armhf.deb",
        "libsqlite3-0": "pool/main/s/sqlite3/libsqlite3-0_3.27.2-3_armhf.deb",
        "libstdc++6": "pool/main/g/gcc-8/libstdc++6_8.3.0-6_armhf.deb",
        "libtinfo6": "pool/main/n/ncurses/libtinfo6_6.1+20181013-2+deb10u2_armhf.deb",
        "libuuid1": "pool/main/u/util-linux/libuuid1_2.33.1-0.1_armhf.deb",
        "python3.7-minimal": "pool/main/p/python3.7/python3.7-minimal_3.7.3-2+deb10u2_armhf.deb",
        "zlib1g": "pool/main/z/zlib/zlib1g_1.2.11.dfsg-1_armhf.deb",
    },
    packages_sha256 = {
        "base-files": "e0a6c8154f64d11f0a0343157b29b397a35228121ad97cb84732c6e1aa036df4",
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
        "libpython3.7-minimal": "9798c3abef9aacf450e44b95359bf377f04a8648b24aeaaea5fc8db4424717cd",
        "libpython3.7-stdlib": "26405b1b7f4bef9c26ea812c1395cf1dc148040a017df949bc2e380568ab38b0",
        "libreadline7": "de3aa01b6ecfa5b57e5011e400abddf9174056588c21b42189b497e65a67d983",
        "libsqlite3-0": "cd7040cec8f05f06c40afea3d3e857890d9fd96ee4aecf61c8c7c0cf72d23004",
        "libstdc++6": "2a22648689ca745554599a818f01241605b2548540d62026116cb07a15df8d09",
        "libtinfo6": "5bb6e9c2dab2309dcd0f0d9d9990f21404032c1082a9bd2b127e13e085592f72",
        "libuuid1": "4bde8f620a8a1e818223ed702478afa836d5bb119a4750bc6795ab67b8cb3589",
        "python3.7-minimal": "1f8bd18580edce377f1e12657e602ceca3db729173c6047b904e9a209a1bf65e",
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
        "libssl1.1": "pool/updates/main/o/openssl/libssl1.1_1.1.1d-0+deb10u3_armhf.deb",
        "openssl": "pool/updates/main/o/openssl/openssl_1.1.1d-0+deb10u3_armhf.deb",
    },
    packages_sha256 = {
        "libexpat1": "8ada16a8a8f5d96eb2dcd89de63d91e7983141ef957cdc71d34ef744f0c9b7d2",
        "libssl1.1": "1d233d0414745cfd3b7899d787fbed73ac8bea0dad15af556b5d2b61e3bc224d",
        "openssl": "393ffad6a63aae5cc97ecaa0e739658d3488a71a39f0987dd153fda539984519",
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
        "ca-certificates": "pool/main/c/ca-certificates/ca-certificates_20190110_all.deb",
        "mime-support": "pool/main/m/mime-support/mime-support_3.62_all.deb",
        "netbase": "pool/main/n/netbase/netbase_5.6_all.deb",
        "python-pip-whl": "pool/main/p/python-pip/python-pip-whl_18.1-5_all.deb",
        "python3-distutils": "pool/main/p/python3-stdlib-extensions/python3-distutils_3.7.3-1_all.deb",
        "python3-lib2to3": "pool/main/p/python3-stdlib-extensions/python3-lib2to3_3.7.3-1_all.deb",
        "python3-pip": "pool/main/p/python-pip/python3-pip_18.1-5_all.deb",
        "python3-pkg-resources": "pool/main/p/python-setuptools/python3-pkg-resources_40.8.0-1_all.deb",
        "python3-setuptools": "pool/main/p/python-setuptools/python3-setuptools_40.8.0-1_all.deb",
        "readline-common": "pool/main/r/readline/readline-common_7.0-5_all.deb",
        "tzdata": "pool/main/t/tzdata/tzdata_2020a-0+deb10u1_all.deb",
    },
    packages_sha256 = {
        "ca-certificates": "f55f88c8cc8fe014fa931fa22eae763fb12771e2b2a04a07bba5e4fdf3a3da6c",
        "mime-support": "776efd686af26fa26325450280e3305463b1faef75d82b383bb00da61893d8ca",
        "netbase": "baf0872964df0ccb10e464b47d995acbba5a0d12a97afe2646d9a6bb97e8d79d",
        "python-pip-whl": "ce2afe34ddd9382df12f3e3964a5387a146a1d34137210fa5eb813301a62bed3",
        "python3-distutils": "6918af11061d3141990e78f5ad0530ec0f9a188cac27113d9de2896203efc13f",
        "python3-lib2to3": "227e2a2d12922c00dee9e55d8c5b889cfc5e72a54b85c2a509fa1664c2e9e137",
        "python3-pip": "b1b7a1cdcef0d9c98bd07f32c0573f5045a2d73ee172cb22635523d86318c35a",
        "python3-pkg-resources": "43783cd63c996b36fcf29bfd8be8c44666148c9129ade88985876d7f9c0bf2f6",
        "python3-setuptools": "cd4967dbdfbb59ca451c0717aedda9ed44b63d565d1eda661c12603ac7d44fb6",
        "readline-common": "153d8a5ddb04044d10f877a8955d944612ec9035f4c73eec99d85a92c3816712",
        "tzdata": "f9464df8a102259df6caff910b810b452fd6e2af34c73ec8729b474dc2f51c55",
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
