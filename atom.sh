#!/usr/bin/env bash

set -e

sudo -v

# Changes the text color to Light-green.
echo -e "\\033[1;92m"

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

curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt update
sudo apt install atom
