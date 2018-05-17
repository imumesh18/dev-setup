#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

echo -n "Installing Gitkraken ..."

# Install dependency for gitkraken
sudo apt install libgnome-keyring-dev libcurl3 > /dev/null

# Downloads gitkraken .deb package for ubuntu
curl -sSL https://release.gitkraken.com/linux/gitkraken-amd64.deb -o /tmp/gitkraken-amd64.deb

# Installs gitkraken
sudo dpkg -i /tmp/gitkraken-amd64.deb > /dev/null

# Clean up
rm -rf /tmp/gitkraken-amd64.deb

# Verify and exit installation
GITKRAKEN_CHECK="$(gitkraken -v 1>&1)"
if [[ "$GITKRAKEN_CHECK" == *"Node started time"* ]]; then
   echo -e "\\033[0;32m[OK]"
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31m[FAILED]"
   echo -e "\\033[0m"
   exit 1
fi
