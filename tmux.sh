#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

# Declare Tmux version
TMUX_VERSION=2.6

# Install dependency for tmux
echo -e "\\033[1;92m**Installing dependencies for Tmux**\\033[1;92m\\033[0m"
sudo apt update
sudo apt install -y automake build-essential pkg-config libevent-dev libncurses5-dev

# Changes the text color to Light-Green.
echo -e "\\033[1;38;5;40m"

cat << "EOF"
 ___           _        _ _ _               _____                     
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _  |_   _| __ ___  _   ___  __
 | || '_ \/ __| __/ _` | | | | '_ \ / _` |   | || '_ ` _ \| | | \ \/ /
 | || | | \__ \ || (_| | | | | | | | (_| |   | || | | | | | |_| |>  < 
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, |   |_||_| |_| |_|\__,_/_/\_\
                                    |___/                             
EOF

# Changes the text color to default
echo -e "\\033[1;92m\\033[0m"

# Remove tmux folder if it already exists
rm -fr /tmp/tmux-${TMUX_VERSION}

# Checks if the tmux tarball already exists or not
if ! [ -f tmux-${TMUX_VERSION}.tar.gz ]; then
    # TODO Replace wget with curl
    # Download and extract tmux latest tarball from github
    wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz && tar xvzf tmux-${TMUX_VERSION}.tar.gz -C /tmp/
    rm -fr tmux-${TMUX_VERSION}.tar.gz
fi
#curl -sSL https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz | tar xvzf tmux-${TMUX_VERSION}.tar.gz -C /tmp/

# Change working diectory
cd /tmp/tmux-${TMUX_VERSION}

# Build tmux from release
./configure && make >/dev/null

# Install tmux from release
sudo make install >/dev/null

# Clean up
echo -e "\\033[1;93m**Cleaning Up the mess**\\033[1;93m\\033[0m"
rm -fr /tmp/tmux-${TMUX_VERSION}

# Verify and exit installation
echo -n "Verifying Tmux installation... "
echo
TMUX_CHECK="$(tmux -V 1>&1)"
if [[ "$TMUX_CHECK" == *"tmux"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Tmux is successfully installed!"
   echo
   tmux -V
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! You broke my script dude :)XD, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi
