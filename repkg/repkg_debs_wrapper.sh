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

NAME=$1
IN_DEBS=$2
OUT_TAR=$3
OUT_DEB=$4
SCRIPT=$5
PASSTHRU=$6

# new package top-level dir
mkdir $NAME
# unpack input debs
pushd $NAME 2>&1 >/dev/null
for deb in $IN_DEBS; do
    ar -x ../$deb data.tar.xz
    tar -xf data.tar.xz
    rm data.tar.xz
done
# run repackaging script
../$SCRIPT "$PASSTHRU"
popd 2>&1 >/dev/null

# deb output
# dummy control file
mkdir $NAME/DEBIAN
cat << EOF > $NAME/DEBIAN/control
Package: $NAME
Version: 1.0-1
Architecture: na
Description: repackaged deb (not a real deb package)
Maintainer: repkg
EOF
# build deb
dpkg-deb --build -Znone $NAME 2>&1 >/dev/null
mv $NAME.deb $OUT_DEB

# tar output
tar -cf $OUT_TAR -C $NAME --exclude='./DEBIAN' .

# clean
rm -rf ./$NAME
