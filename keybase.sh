#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

# Changes the text color to Teal.
echo -e "\\033[1;38;5;23m"

cat << "EOF"
 ___           _        _ _ _               _  __          _                    
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _  | |/ /___ _   _| |__   __ _ ___  ___ 
 | || '_ \/ __| __/ _` | | | | '_ \ / _` | | ' // _ \ | | | '_ \ / _` / __|/ _ \
 | || | | \__ \ || (_| | | | | | | | (_| | | . \  __/ |_| | |_) | (_| \__ \  __/
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, | |_|\_\___|\__, |_.__/ \__,_|___/\___|
                                    |___/            |___/                      
EOF

# Changes the text color to default
echo -e "\\033[1;92m\\033[0m"

# Downloads gitkraken .deb package for ubuntu
echo -e "\\033[1;92m Downloading.....\\033[1;92m\\033[0m"
curl -sSL https://prerelease.keybase.io/keybase_amd64.deb -o /tmp/keybase_amd64.deb

# Installs gitkraken
sudo dpkg -i /tmp/keybase_amd64.deb
sudo apt-get install -f

# Clean up
echo -e "\\033[1;93m**Cleaning Up the mess**\\033[1;93m\\033[0m"
rm -rf /tmp/keybase_amd64.deb

# Verify and exit installation
echo "Verifying Keybase installation... "
echo
KEYBASE_CHECK="$(keybase version 1>&1)"
if [[ "$KEYBASE_CHECK" == *""* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Keybase is successfully installed!"
   echo
   keybase version
   echo
   echo "To run keybase use: run_keybase"
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! You broke my script dude :)XD, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi
