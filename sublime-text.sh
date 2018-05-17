#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

echo -n "Installing Sublime Text Editor ..."

# Imports Sublime text gpg key 
curl -sSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - /dev/null 2>&1

# Adds the Sublime text apt PPA 
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null

# Update packages and Installs Sublime text latest version
sudo apt update > /dev/null
sudo apt install -y sublime-text /dev/null

# Verify and exit installation
SUBLIME_CHECK="$(subl -v 1>&1)"
if [[ "$SUBLIME_CHECK" == *"Sublime Text Build"* ]]; then
   echo -e "\\033[0;32m[OK]\\033[0m"
   exit 0
else
   echo -e "\\033[0;31m[FAILED]\\033[0m"
   exit 1
fi
