#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

# Declare Virtual Box version
VBOX_VERSION=5.2

echo -n "Installing Virtual Box ..."

# Adds the Virtual Box apt PPA
sudo sh -c 'echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" > /etc/apt/sources.list.d/vscode.list'

# Imports  Virtual Box gpg key
curl -sSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add - /dev/null 2>&1

# Update packages and Installs Virtual Box Code latest version
sudo apt-get update >/dev/null
sudo apt-get install -y virtualbox-${VBOX_VERSION} >/dev/null

# Verify and exit installation
VBOX_CHECK="$(vboxmanage -v 1>&1)"
if [[ "$VBOX_CHECK" == *"${VBOX_VERSION}"* ]]; then
  echo -e "\\033[0;32m[OK]\\033[0m"
  exit 0
else
  echo -e "\\033[0;31m[FAILED]\\033[0m"
  exit 1
fi
