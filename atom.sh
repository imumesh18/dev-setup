#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

# Changes the text color to Grey.
echo -e "\\033[1;38;5;59m"

cat << "EOF"
 ___           _        _ _ _                  _   _                  
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _     / \ | |_ ___  _ __ ___  
 | || '_ \/ __| __/ _` | | | | '_ \ / _` |   / _ \| __/ _ \| '_ ` _ \ 
 | || | | \__ \ || (_| | | | | | | | (_| |  / ___ \ || (_) | | | | | |
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, | /_/   \_\__\___/|_| |_| |_|
                                    |___/                             
EOF

# Changes the text color to default
echo -e "\\033[0m"

# Imports Atom text editor gpg key 
curl -sSL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -

# Adds the Atom text editor apt PPA 
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

# Update packages and Installs Atom text editor latest version 
sudo apt update
sudo apt install -y atom

# Verify and exit installation
echo "Verifying Atom Text Editor installation... "
echo
ATOM_CHECK="$(atom -v 1>&1)"
if [[ "$ATOM_CHECK" == *"Atom"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Atom Text Editor is successfully installed!"
   echo
   atom -v
   echo -e "\\033[1mHACK THE WORLD!\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! You broke my script dude :)XD, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi
