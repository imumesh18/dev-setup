#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

# Install dependency for gitkraken
echo -e "\\033[1;92m**Installing dependencies for Gitkraken**\\033[1;92m\\033[0m"
sudo apt install libgnome-keyring-dev libcurl3

# Changes the text color to Teal.
echo -e "\\033[1;38;5;23m"

cat << "EOF"
 ___           _        _ _ _                ____ _ _   _              _              
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _   / ___(_) |_| | ___ __ __ _| | _____ _ __  
 | || '_ \/ __| __/ _` | | | | '_ \ / _` | | |  _| | __| |/ / '__/ _` | |/ / _ \ '_ \ 
 | || | | \__ \ || (_| | | | | | | | (_| | | |_| | | |_|   <| | | (_| |   <  __/ | | |
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, |  \____|_|\__|_|\_\_|  \__,_|_|\_\___|_| |_|
                                    |___/                                             
EOF

# Changes the text color to default
echo -e "\\033[1;92m\\033[0m"

# Downloads gitkraken .deb package for ubuntu
echo -e "\\033[1;92m Downloading.....\\033[1;92m\\033[0m"
curl -sSL https://release.gitkraken.com/linux/gitkraken-amd64.deb -o /tmp/gitkraken-amd64.deb

# Installs gitkraken
sudo dpkg -i /tmp/gitkraken-amd64.deb

# Clean up
echo -e "\\033[1;93m**Cleaning Up the mess**\\033[1;93m\\033[0m"
rm -rf /tmp/gitkraken-amd64.deb

# Verify and exit installation
echo "Verifying Gitkraken installation... "
echo
GITKRAKEN_CHECK="$(gitkraken -v 1>&1)"
if [[ "$GITKRAKEN_CHECK" == *"Node started time"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Gitkraken is successfully installed!"
   echo
   gitkraken -v
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! You broke my script dude :)XD, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi
