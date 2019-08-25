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

# defaults

if [ -z "$PROJECT_REGISTRY_PREFIX" ]; then
    PROJECT_REGISTRY_PREFIX="discolix"
fi

if [ -z "$PROJECT_GIT_COMMIT" ]; then
    PROJECT_GIT_COMMIT=$(git rev-parse HEAD)
fi

if [ -z "$PROJECT_GIT_BRANCH" ]; then
    PROJECT_GIT_BRANCH=$(git symbolic-ref -q HEAD)
    PROJECT_GIT_BRANCH=${PROJECT_GIT_BRANCH##refs/heads/}
    PROJECT_GIT_BRANCH=${PROJECT_GIT_BRANCH:-HEAD}
fi

# workspace command status vars

echo "PROJECT_REGISTRY_PREFIX $PROJECT_REGISTRY_PREFIX"
echo "PROJECT_GIT_COMMIT $PROJECT_GIT_COMMIT"
echo "PROJECT_GIT_BRANCH $PROJECT_GIT_BRANCH"
