#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

# Declare Tmux version
TMUX_VERSION=2.6

echo -n "Installing TMUX ..."

# Install dependency for tmux
sudo apt update >/dev/null
sudo apt install -y automake build-essential pkg-config libevent-dev libncurses5-dev >/dev/null

# Remove tmux folder if it already exists
if [ -d "/tmp/tmux-${TMUX_VERSION}" ]; then
  rm -fr /tmp/tmux-${TMUX_VERSION}
fi

# Checks if the tmux tarball already exists or not
if ! [ -f tmux-${TMUX_VERSION}.tar.gz ]; then
  # TODO Replace wget with curl
  # Download and extract tmux latest tarball from github
  wget -q https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz && tar xvzf tmux-${TMUX_VERSION}.tar.gz -C /tmp/ >/dev/null
  rm -fr tmux-${TMUX_VERSION}.tar.gz
fi

# Change working diectory
cd /tmp/tmux-${TMUX_VERSION}

# Build tmux from release
./configure && make >/dev/null

# Install tmux from release
sudo make install >/dev/null

# Clean up
rm -fr /tmp/tmux-${TMUX_VERSION}

# Verify and exit installation
TMUX_CHECK="$(tmux -V 1>&1)"
if [[ "$TMUX_CHECK" == *"tmux"* ]]; then
  echo -e "\\033[0;32m[OK]\\033[0m"
  exit 0
else
  echo -e "\\033[0;31m[FAILED]\\033[0m"
  exit 1
fi
