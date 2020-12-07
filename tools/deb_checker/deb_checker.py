# Copyright 2020 Erik Maciejewski
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
"""Script for checking url 404s parsed from deb_packages in WORKSPACE"""
import os
import logging
import subprocess
import requests

from notifiers import get_notifier
from api_proto import api_pb2 as buildozer_api_pb2

logging.basicConfig(level=logging.WARN)


def deb_data_from_workspace():
    with open("WORKSPACE", "rb") as workspace:
        workspace_bytes = workspace.read()

    buildozer_bin = "external/bazel_buildtools/buildozer/buildozer_/buildozer"
    args = ["-output_proto", "print mirrors packages", "-:%deb_packages"]
    p = subprocess.Popen([buildozer_bin] + args, stdin=subprocess.PIPE,
                         stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    pout, perr = p.communicate(input=workspace_bytes)
    p.wait()

    if p.returncode != 0:
        raise ChildProcessError(perr.decode("utf-8"))

    output = buildozer_api_pb2.Output()
    output.ParseFromString(pout)
    return output


def build_urls_to_check():
    urls = []

    for rec in deb_data_from_workspace().records:
        url_prefix = rec.fields[0].list.strings[0]  # mirrors
        debs = eval(rec.fields[1].text)  # packages

        for _, path in debs.items():
            urls.append("{}/{}".format(url_prefix, path))

    return urls


def check_for_bad_urls(urls):

    def found_at(url, status_not_found=404):
        resp = requests.request("HEAD", url)
        return not resp.status_code == status_not_found

    return [url for url in urls if not found_at(url)]


def check_for_bad_urls_and_notify(urls, notify_callback):
    bad_urls = check_for_bad_urls(urls)
    if bad_urls:
        msg = "The following urls are 404:\n\n{}".format("\n".join(bad_urls))
        notify_callback(msg)


def notify_via_notifiers(msg):
    params = {}
    paramlist = os.environ["DEB_CHECKER_NOTIFIERS"].split(",")
    for param in paramlist[1:]:
        key, val = param.split("=")
        params[key] = val
    # send it
    telegram = get_notifier(paramlist[0])
    telegram.notify(message=msg, **params)


if __name__ == "__main__":
    check_for_bad_urls_and_notify(build_urls_to_check(), notify_via_notifiers)
