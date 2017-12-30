#!/usr/bin/env bash

set -e

# Install dependency for gitkraken
echo -e "\\033[1;92m**Installing dependencies for Gitkraken**\\033[1;92m\\033[0m"
sudo apt install libgnome-keyring-dev libcurl3

# Changes the text color to Light-green.
echo -e "\\033[1;92m"

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

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
dpkg -i gitkraken-amd64.deb
rm -f gitkraken-amd64.deb