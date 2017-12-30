#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

# Changes the text color to Light-Orange.
echo -e "\\033[1;38;5;208m"

cat << "EOF"
 ___           _        _ _ _               ____        _     _ _                  _____         _   
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _  / ___| _   _| |__ | (_)_ __ ___   ___  |_   _|____  _| |_ 
 | || '_ \/ __| __/ _` | | | | '_ \ / _` | \___ \| | | | '_ \| | | '_ ` _ \ / _ \   | |/ _ \ \/ / __|
 | || | | \__ \ || (_| | | | | | | | (_| |  ___) | |_| | |_) | | | | | | | |  __/   | |  __/>  <| |_ 
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, | |____/ \__,_|_.__/|_|_|_| |_| |_|\___|   |_|\___/_/\_\\__|
                                    |___/                                                            
EOF

# Changes the text color to default
echo -e "\\033[0m"

# Imports Sublime text gpg key 
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# Adds the Sublime text apt PPA 
ech "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Update packages and Installs Sublime text latest version
sudo apt update
sudo apt install -y sublime-text

# TODO Add Verification of installation
