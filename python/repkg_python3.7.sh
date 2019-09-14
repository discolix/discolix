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

NONROOT=65532

# discard man stuff
rm -rf usr/share/man/

mkdir -p usr/local/lib/python3.7 2> /dev/null || true
chmod 2775 usr/local/lib/python3.7 2> /dev/null || true
# nonroot user
chown root:$NONROOT usr/local/lib/python3.7 2> /dev/null || true

mkdir -p usr/local/lib/python3.7/dist-packages 2> /dev/null || true
chmod 2775 usr/local/lib/python3.7/dist-packages 2> /dev/null || true
# nonroot user
chown root:$NONROOT usr/local/lib/python3.7 2> /dev/null || true

# bytecode "standard" compile stdlib
#filt='fgrep -v sitecustomize.py'
#if ls -L usr/lib/python3.7/sitecustomize.py >/dev/null 2>&1; then
#    filt='cat'
#fi
#files=$(find . -type f | sed -n '/^\.\/usr\/lib\/python3.7\/.*\.py$/p' | $filt)
#/usr/bin/python3.7 -E -S /usr/lib/python3.7/py_compile.py $files

# symlinks
ln -s python3.7 usr/bin/python3
ln -s python3 usr/bin/python
