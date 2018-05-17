#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

echo -n "Installing Atom Text Editor ..."

# Imports Atom text editor gpg key 
curl -sSL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add - > /dev/null 2>&1

# Adds the Atom text editor apt PPA 
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

# Update packages and Installs Atom text editor latest version 
sudo apt update > /dev/null
sudo apt install -y atom > /dev/null

# Verify and exit installation
ATOM_CHECK="$(atom -v 1>&1)"
if [[ "$ATOM_CHECK" == *"Atom"* ]]; then
   echo -e "\\033[0;32m[OK]\\033[0m"
   exit 0
else
   echo -e "\\033[0;31m[FAILED]\\033[0m"
   exit 1
fi
