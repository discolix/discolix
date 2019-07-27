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

CMDS=$1

# only take what we want to repackage and toss the rest
tar -xf $REPKG_DEB_DATA_MODULE ./usr/share/doc/busybox-static/copyright
tar -xf $REPKG_DEB_DATA_MODULE ./bin/busybox
rm $REPKG_DEB_DATA_MODULE

# rename bin dir to keep busybox out of the root fs bin dir
mv bin busybox

# generate command symlinks to busybox executable
cd busybox
for cmd in $CMDS; do
  ln -s busybox $cmd
done
cd .. 

# new data module
tar -cf data.tar \
  busybox/ \
  usr/share/doc/busybox-static/copyright

# cleanup
rm -rf usr/share/doc/busybox-static
rm -rf busybox
