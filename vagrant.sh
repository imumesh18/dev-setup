#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

# Declare Vagrant version
VAGRANT_VERSION=2.0.1

# Changes the text color to Light-Blue.
echo -e "\\033[1;38;5;27m"

cat << "EOF"
 ___           _        _ _ _              __     __                          _   
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _  \ \   / /_ _  __ _ _ __ __ _ _ __ | |_ 
 | || '_ \/ __| __/ _` | | | | '_ \ / _` |  \ \ / / _` |/ _` | '__/ _` | '_ \| __|
 | || | | \__ \ || (_| | | | | | | | (_| |   \ V / (_| | (_| | | | (_| | | | | |_ 
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, |    \_/ \__,_|\__, |_|  \__,_|_| |_|\__|
                                    |___/               |___/                     
EOF

# Changes the text color to default
echo -e "\\033[0m"

# # Downloads gitkraken .deb package for ubuntu
# echo -e "\\033[1;92m Downloading.....\\033[1;92m\\033[0m"
# curl -sSL https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb -o /tmp/vagrant_${VAGRANT_VERSION}_x86_64.deb

# # Installs gitkraken
# sudo dpkg -i /tmp/vagrant_${VAGRANT_VERSION}_x86_64.deb

# # Clean up
# echo -e "\\033[1;93m**Cleaning Up the mess**\\033[1;93m\\033[0m"
# rm -f /tmp/vagrant_${VAGRANT_VERSION}_x86_64.deb

# Verify and exit installation
echo "Verifying Vagrant installation... "
echo
VAGRANT_CHECK="$(vagrant -v 1>&1)"
if [[ "$VAGRANT_CHECK" == *"Vagrant $VAGRANT_VERSION"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Vagrant is successfully installed!"
   echo
   vagrant -v
   echo -e "\\033[0m"
   exit 0
else
   echo 
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! You broke my script dude :)XD, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi
