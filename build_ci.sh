#!/usr/bin/env bash
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

set -e

# CONFIG

# travis integrations

DISCOLIX_IS_MASTER=no
if [ "$TRAVIS_BRANCH" == "master" ]; then
    DISCOLIX_IS_MASTER=yes
fi

DISCOLIX_GIT_COMMIT=none
if [ -n "$TRAVIS_COMMIT" ]; then
    DISCOLIX_GIT_COMMIT=$TRAVIS_COMMIT
fi

REGISTRY_NAMESPACE="discolix"

DISCOLIX_ARCHES="amd64 arm64 arm"

DISCOLIX_BAZEL_CMD="docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /tmp:/tmp \
    -v $PWD:/build \
    -w /build \
    $REGISTRY_NAMESPACE/build:$DISCOLIX_GIT_COMMIT bazel --bazelrc=.bazelrc_ci"

export DOCKER_CLI_EXPERIMENTAL=enabled

# BUILD
docker pull $REGISTRY_NAMESPACE/build || true
docker build --cache-from $REGISTRY_NAMESPACE/build \
    --target build \
    -t $REGISTRY_NAMESPACE/build:$DISCOLIX_GIT_COMMIT .

$DISCOLIX_BAZEL_CMD build //base/... //cc/...

# TEST
$DISCOLIX_BAZEL_CMD test //tests/...

# PUBLISH
# only publish master
if [ $DISCOLIX_IS_MASTER == "no" ]; then
    exit 0
fi

function retag_arch_bundle() {
    local old_prefix=$1; local new_prefix=$2
    for arch in $DISCOLIX_ARCHES; do
        docker tag $old_prefix$arch $new_prefix$arch
    done
}

function bundle_push() {
    local prefix=$1
    for arch in $DISCOLIX_ARCHES; do
        docker push $prefix$arch
    done
}

function manifest_push() {
    local manifest=$1; local prefix=$2
    imgs=""
    for arch in $DISCOLIX_ARCHES; do
        imgs+="$prefix$arch "
    done
    docker manifest create $manifest $imgs
    for arch in $DISCOLIX_ARCHES; do
        docker manifest annotate --arch $arch $manifest $prefix$arch
    done
    docker manifest push --purge $manifest
}

function manifest_bundle_push() {
    local manifest=$1; local prefix=$2
    bundle_push $prefix
    manifest_push $manifest $prefix
}

# load all publishable images into docker
$DISCOLIX_BAZEL_CMD run //:load_all_images
echo "$REGISTRY_PASS" | docker login -u "$REGISTRY_USER" --password-stdin || true

# retag static
retag_arch_bundle "bazel/base:static-" "$REGISTRY_NAMESPACE/static:$DISCOLIX_GIT_COMMIT-linux_"
retag_arch_bundle "bazel/base:static-nonroot-" "$REGISTRY_NAMESPACE/static:nonroot-linux_"

# retag base
retag_arch_bundle "bazel/base:" "$REGISTRY_NAMESPACE/base:$DISCOLIX_GIT_COMMIT-linux_"
retag_arch_bundle "bazel/base:nonroot-" "$REGISTRY_NAMESPACE/base:nonroot-linux_"
retag_arch_bundle "bazel/base:debug-" "$REGISTRY_NAMESPACE/base:debug-linux_"
retag_arch_bundle "bazel/base:debug-nonroot-" "$REGISTRY_NAMESPACE/base:debug-nonroot-linux_"

# retag cc
retag_arch_bundle "bazel/cc:" "$REGISTRY_NAMESPACE/cc:$DISCOLIX_GIT_COMMIT-linux_"
retag_arch_bundle "bazel/cc:nonroot-" "$REGISTRY_NAMESPACE/cc:nonroot-linux_"
retag_arch_bundle "bazel/cc:debug-" "$REGISTRY_NAMESPACE/cc:debug-linux_"
retag_arch_bundle "bazel/cc:debug-nonroot-" "$REGISTRY_NAMESPACE/cc:debug-nonroot-linux_"

# push static
manifest_bundle_push "$REGISTRY_NAMESPACE/static:$DISCOLIX_GIT_COMMIT" "$REGISTRY_NAMESPACE/static:$DISCOLIX_GIT_COMMIT-linux_"
manifest_bundle_push "$REGISTRY_NAMESPACE/static:nonroot" "$REGISTRY_NAMESPACE/static:nonroot-linux_"

# push base
manifest_bundle_push "$REGISTRY_NAMESPACE/base:$DISCOLIX_GIT_COMMIT" "$REGISTRY_NAMESPACE/base:$DISCOLIX_GIT_COMMIT-linux_"
manifest_bundle_push "$REGISTRY_NAMESPACE/base:nonroot" "$REGISTRY_NAMESPACE/base:nonroot-linux_"
manifest_bundle_push "$REGISTRY_NAMESPACE/base:debug" "$REGISTRY_NAMESPACE/base:debug-linux_"
manifest_bundle_push "$REGISTRY_NAMESPACE/base:debug-nonroot" "$REGISTRY_NAMESPACE/base:debug-nonroot-linux_"

# push cc
manifest_bundle_push "$REGISTRY_NAMESPACE/cc:$DISCOLIX_GIT_COMMIT" "$REGISTRY_NAMESPACE/cc:$DISCOLIX_GIT_COMMIT-linux_"
manifest_bundle_push "$REGISTRY_NAMESPACE/cc:nonroot" "$REGISTRY_NAMESPACE/cc:nonroot-linux_"
manifest_bundle_push "$REGISTRY_NAMESPACE/cc:debug" "$REGISTRY_NAMESPACE/cc:debug-linux_"
manifest_bundle_push "$REGISTRY_NAMESPACE/cc:debug-nonroot" "$REGISTRY_NAMESPACE/cc:debug-nonroot-linux_"

# set latest static
retag_arch_bundle "$REGISTRY_NAMESPACE/static:$DISCOLIX_GIT_COMMIT-linux_" "$REGISTRY_NAMESPACE/static:latest-linux_"
manifest_bundle_push "$REGISTRY_NAMESPACE/static:latest" "$REGISTRY_NAMESPACE/static:latest-linux_"

# set latest base
retag_arch_bundle "$REGISTRY_NAMESPACE/base:$DISCOLIX_GIT_COMMIT-linux_" "$REGISTRY_NAMESPACE/base:latest-linux_"
manifest_bundle_push "$REGISTRY_NAMESPACE/base:latest" "$REGISTRY_NAMESPACE/base:latest-linux_"

# set latest cc
retag_arch_bundle "$REGISTRY_NAMESPACE/cc:$DISCOLIX_GIT_COMMIT-linux_" "$REGISTRY_NAMESPACE/cc:latest-linux_"
manifest_bundle_push "$REGISTRY_NAMESPACE/cc:latest" "$REGISTRY_NAMESPACE/cc:latest-linux_"

# push any changes to the build image
docker tag $REGISTRY_NAMESPACE/build:$DISCOLIX_GIT_COMMIT $REGISTRY_NAMESPACE/build:latest
docker push $REGISTRY_NAMESPACE/build:$DISCOLIX_GIT_COMMIT
docker push $REGISTRY_NAMESPACE/build:latest
