#!/usr/bin/env sh
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

# The following vars should be defined in the environment executing this script
#PROJECT_GIT_BRANCH=  # example: master
#PROJECT_GIT_COMMIT=  # example: e58a4cd1a5591654442546e68d7ee5e0168b0f84

# only publish master
if [ "$PROJECT_GIT_BRANCH" != "master" ]; then
    exit 0
fi

if [ -z "$PROJECT_REGISTRY_PREFIX" ]; then
    PROJECT_REGISTRY_PREFIX="discolix"
fi

DISCOLIX_ARCHES="amd64 arm64 arm"

export DOCKER_CLI_EXPERIMENTAL=enabled

retag_arch_bundle() {
    local old_prefix=$1; local new_prefix=$2
    for arch in $DISCOLIX_ARCHES; do
        docker tag $old_prefix$arch $new_prefix$arch
    done
}

publish_arch_bundle() {
    local manifest=$1; local prefix=$2
    # push arch image bundle
    for arch in $DISCOLIX_ARCHES; do
        docker push $prefix$arch
    done
    # create and push manifest for arch image bundle
    imgs=""
    for arch in $DISCOLIX_ARCHES; do
        imgs="$imgs $prefix$arch"
    done
    docker manifest create $manifest $imgs
    for arch in $DISCOLIX_ARCHES; do
        docker manifest annotate --arch $arch $manifest $prefix$arch
    done
    docker manifest push --purge $manifest
}

# load all publishable images into docker
tools/ci/bazel.sh run //:load_all_images

echo "$REGISTRY_PASS" | docker login -u "$REGISTRY_USER" --password-stdin || true

# publish static manifest bundles
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/static:$PROJECT_GIT_COMMIT" "$PROJECT_REGISTRY_PREFIX/static:$PROJECT_GIT_COMMIT-linux_"
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/static:nonroot" "$PROJECT_REGISTRY_PREFIX/static:nonroot-linux_"

# publish base manifest bundles
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/base:$PROJECT_GIT_COMMIT" "$PROJECT_REGISTRY_PREFIX/base:$PROJECT_GIT_COMMIT-linux_"
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/base:nonroot" "$PROJECT_REGISTRY_PREFIX/base:nonroot-linux_"
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/base:debug" "$PROJECT_REGISTRY_PREFIX/base:debug-linux_"
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/base:debug-nonroot" "$PROJECT_REGISTRY_PREFIX/base:debug-nonroot-linux_"

# publish cc manifest bundles
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/cc:$PROJECT_GIT_COMMIT" "$PROJECT_REGISTRY_PREFIX/cc:$PROJECT_GIT_COMMIT-linux_"
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/cc:nonroot" "$PROJECT_REGISTRY_PREFIX/cc:nonroot-linux_"
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/cc:debug" "$PROJECT_REGISTRY_PREFIX/cc:debug-linux_"
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/cc:debug-nonroot" "$PROJECT_REGISTRY_PREFIX/cc:debug-nonroot-linux_"

# publish static latest manifest bundle
retag_arch_bundle "$PROJECT_REGISTRY_PREFIX/static:$PROJECT_GIT_COMMIT-linux_" "$PROJECT_REGISTRY_PREFIX/static:latest-linux_"
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/static:latest" "$PROJECT_REGISTRY_PREFIX/static:latest-linux_"

# publish base latest manifest bundle
retag_arch_bundle "$PROJECT_REGISTRY_PREFIX/base:$PROJECT_GIT_COMMIT-linux_" "$PROJECT_REGISTRY_PREFIX/base:latest-linux_"
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/base:latest" "$PROJECT_REGISTRY_PREFIX/base:latest-linux_"

# publish cc latest manifest bundle
retag_arch_bundle "$PROJECT_REGISTRY_PREFIX/cc:$PROJECT_GIT_COMMIT-linux_" "$PROJECT_REGISTRY_PREFIX/cc:latest-linux_"
publish_arch_bundle "$PROJECT_REGISTRY_PREFIX/cc:latest" "$PROJECT_REGISTRY_PREFIX/cc:latest-linux_"

# push any changes to the build image
docker tag $PROJECT_REGISTRY_PREFIX/build:latest $PROJECT_REGISTRY_PREFIX/build:$PROJECT_GIT_COMMIT
docker push $PROJECT_REGISTRY_PREFIX/build:$PROJECT_GIT_COMMIT
docker push $PROJECT_REGISTRY_PREFIX/build:latest
