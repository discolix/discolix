#!/usr/bin/env bash
# Copyright 2017 Google Inc. All rights reserved.
# Modifications copyright 2019 Erik Maciejewski
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

tar -xf $REPKG_DEB_DATA_MODULE ./usr/share/doc/ca-certificates/copyright
tar -xf $REPKG_DEB_DATA_MODULE ./usr/share/ca-certificates

# We'll create a new data.tar.xz with flattened certs and
# the copyright
rm $REPKG_DEB_DATA_MODULE

# Concat all the certs.
CERT_FILE=./etc/ssl/certs/ca-certificates.crt
mkdir -p $(dirname $CERT_FILE)

CERTS=$(find usr/share/ca-certificates -type f | sort)
for cert in $CERTS; do
  cat $cert >> $CERT_FILE
done

tar -cf data.tar \
  etc/ \
  usr/share/doc/ca-certificates/copyright

rm -rf usr/share/ca-certificates
rm -rf etc/ssl/certs/ca-certificate.crt
