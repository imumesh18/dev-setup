#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

echo -n "Installing Keybase ..."

# Downloads gitkraken .deb package for ubuntu
curl -sSL https://prerelease.keybase.io/keybase_amd64.deb -o /tmp/keybase_amd64.deb

# Installs gitkraken
sudo dpkg -i /tmp/keybase_amd64.deb > /dev/null
sudo apt-get install -f > /dev/null

# Clean up
rm -rf /tmp/keybase_amd64.deb

# Verify and exit installation
KEYBASE_CHECK="$(keybase version 1>&1)"
if [[ "$KEYBASE_CHECK" == *""* ]]; then
   echo -e "\\033[0;32m[OK]\\033[0m"
   exit 0
else
   echo -e "\\033[0;31m[FAILED]\\033[0m"
   exit 1
fi
