#!/bin/sh
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

# grab what we need
cp usr/bin/qemu-aarch64-static .
cp usr/bin/qemu-arm-static .

# discard all in usr/ except copyright (will preserve copyright path, since
# non-empty dirs will error when attempting to delete, and hence the || true)
find usr/ -not -name 'copyright' -delete >/dev/null 2>&1 || true

mkdir usr/bin
cp qemu-aarch64-static usr/bin/
cp qemu-arm-static usr/bin/
