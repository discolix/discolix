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

IN_DEB=$1
OUT_TAR=$2
OUT_DEB=$3
SCRIPT=$4
PASSTHRU=$5

# use the input deb as the template for the output deb
cp "$IN_DEB" "$OUT_DEB"
# extract data module from deb to repackage
ar -x "$IN_DEB" data.tar.xz
# execute repackaging script
export REPKG_DEB_DATA_MODULE=data.tar.xz
$SCRIPT "$PASSTHRU"
# delete old data module from output deb
ar -d "$OUT_DEB" data.tar.xz
# add our repackaged data module to output deb
ar -r "$OUT_DEB" data.tar
mv data.tar "$OUT_TAR"
