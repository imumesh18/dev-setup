#!/usr/bin/env bash

set -e

sudo -v

# Changes the text color to Light-green.
echo -e "\\033[1;94m"

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

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code
