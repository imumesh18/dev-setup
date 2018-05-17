#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

echo -n "Installing Visual Studio Code ..."

# Imports  Visual Studio Code gpg key
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

# Adds the Visual Studio Code apt PPA
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Update packages and Installs Visual Studio Code latest version 
sudo apt-get update > /dev/null
sudo apt-get install -y code > /dev/null

# Verify and exit installation
CODE_CHECK="$(code -v 3>&1)"
if [[ "$CODE_CHECK" == *"x64"* ]]; then
   echo -e "\\033[0;32m[OK]\\033[0m"
   exit 0
else
   echo -e "\\033[0;31m[FAILED]\\033[0m"
   exit 1
fi
