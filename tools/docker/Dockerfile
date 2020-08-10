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
#
# containerized build environment
FROM debian:buster as build
# install build toolchain and deps
RUN apt-get update && \
    apt-get install -y \
        curl zip unzip patch git pkg-config zlib1g-dev \
        gcc g++ python3 python3-pip python3-six && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV INSTALL_BAZEL_VERSION=3.4.1
RUN curl -L https://github.com/bazelbuild/bazel/releases/download/${INSTALL_BAZEL_VERSION}/bazel-${INSTALL_BAZEL_VERSION}-installer-linux-x86_64.sh \
        -o bazel-${INSTALL_BAZEL_VERSION}-installer-linux-x86_64.sh && \
    chmod +x bazel-${INSTALL_BAZEL_VERSION}-installer-linux-x86_64.sh && \
    ./bazel-${INSTALL_BAZEL_VERSION}-installer-linux-x86_64.sh && \
    rm -f bazel-${INSTALL_BAZEL_VERSION}-installer-linux-x86_64.sh
ENV INSTALL_DOCKER_VERSION=19.03.12
ENV DOCKER_CLI_EXPERIMENTAL=enabled
RUN curl -L https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_${INSTALL_DOCKER_VERSION}~3-0~ubuntu-bionic_amd64.deb \
        -o docker-ce-cli_${INSTALL_DOCKER_VERSION}~3-0~ubuntu-bionic_amd64.deb && \
    dpkg -i docker-ce-cli_${INSTALL_DOCKER_VERSION}~3-0~ubuntu-bionic_amd64.deb
# containerized development environment
FROM build as devel
RUN echo 'PS1="\[$(tput setaf 3)$(tput bold)[\]devel@\\h:\\W]#\[$(tput sgr0) \]"' >> /root/.bashrc
