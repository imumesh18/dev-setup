#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

# Changes the text color to Light-Blue.
echo -e "\\033[1;38;5;25m"

cat << "EOF"
 ___           _        _ _ _              __     ______     ____          _      
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _  \ \   / / ___|   / ___|___   __| | ___ 
 | || '_ \/ __| __/ _` | | | | '_ \ / _` |  \ \ / /\___ \  | |   / _ \ / _` |/ _ \
 | || | | \__ \ || (_| | | | | | | | (_| |   \ V /  ___) | | |__| (_) | (_| |  __/
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, |    \_/  |____/   \____\___/ \__,_|\___|
                                    |___/                                         
EOF

# Changes the text color to default
echo -e "\\033[0m"

# Imports  Visual Studio Code gpg key
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

# Adds the Visual Studio Code apt PPA
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Update packages and Installs Visual Studio Code latest version 
sudo apt-get update
sudo apt-get install -y code

# Verify and exit installation
echo -n "Verifying Visual Studio Code installation... "
echo
CODE_CHECK="$(code -v 3>&1)"
if [[ "$CODE_CHECK" == *"x64"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Visual Studio Code is successfully installed!"
   echo
   code -v
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! Something went wrong, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi
