#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

# Declare Virtual Box version
VBOX_VERSION=5.2
VBOX_DIST="xenial"

# Changes the text color to NAVY-Blue.
echo -e "\\033[1;38;5;17m"

cat << "EOF"
 ___           _        _ _ _              __     ___      _               _   ____            
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _  \ \   / (_)_ __| |_ _   _  __ _| | | __ )  _____  __
 | || '_ \/ __| __/ _` | | | | '_ \ / _` |  \ \ / /| | '__| __| | | |/ _` | | |  _ \ / _ \ \/ /
 | || | | \__ \ || (_| | | | | | | | (_| |   \ V / | | |  | |_| |_| | (_| | | | |_) | (_) >  < 
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, |    \_/  |_|_|   \__|\__,_|\__,_|_| |____/ \___/_/\_\
                                    |___/                                                      
EOF

# Changes the text color to default
echo -e "\\033[0m"

# Adds the Virtual Box apt PPA
sudo sh -c 'echo "deb https://download.virtualbox.org/virtualbox/debian ${VBOX_DIST} contrib" > /etc/apt/sources.list.d/vscode.list'

# Imports  Virtual Box gpg key
curl -sSL https://www.virtualbox.org/download/oracle_vbox.asc | sudo apt-key add -

# Update packages and Installs Virtual Box Code latest version 
sudo apt-get update
sudo apt-get install -y virtualbox-${VBOX_VERSION}

# Verify and exit installation
echo "Verifying Virtual Box installation... "
echo
VBOX_CHECK="$(vboxmanage -v 1>&1)"
if [[ "$VBOX_CHECK" == *"${VBOX_VERSION}"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Virtual Box is successfully installed!"
   echo
   vboxmanage -v
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! You broke my script dude :)XD, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi
