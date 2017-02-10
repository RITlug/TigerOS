#!/bin/sh

# This script will replace the omni.jar in the /usr/lib/firefox-6/ with
# the one in /usr/lib/firefox-6/omni-backup/

su
pushd /usr/lib/firefox-6/
rm omni.jar
cp omni-backup/omni.jar omni.jar
popd
exit