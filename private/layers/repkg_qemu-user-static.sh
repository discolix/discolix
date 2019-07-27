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

# only take what we want to repackage and toss the rest
tar -xf $REPKG_DEB_DATA_MODULE ./usr/bin/qemu-aarch64-static
tar -xf $REPKG_DEB_DATA_MODULE ./usr/bin/qemu-arm-static
tar -xf $REPKG_DEB_DATA_MODULE ./usr/share/doc/qemu-user-static/copyright
rm $REPKG_DEB_DATA_MODULE

# new data module
tar -cf data.tar usr/

# cleanup
rm -rf usr/share/doc/qemu-user-static
rm -rf usr/bin
