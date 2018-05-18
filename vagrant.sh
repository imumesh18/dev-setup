#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

# Declare Vagrant version
VAGRANT_VERSION=2.1.1

echo -n "Installing Vagrant ..."

# Downloads Vagrant .deb package for ubuntu
curl -sSL https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb -o /tmp/vagrant_${VAGRANT_VERSION}_x86_64.deb

# Installs Vagrant
sudo dpkg -i /tmp/vagrant_${VAGRANT_VERSION}_x86_64.deb >/dev/null

# Clean up
rm -f /tmp/vagrant_${VAGRANT_VERSION}_x86_64.deb

# Verify and exit installation
VAGRANT_CHECK="$(vagrant -v 1>&1)"
if [[ "$VAGRANT_CHECK" == *"Vagrant $VAGRANT_VERSION"* ]]; then
  echo -e "\\033[0;32m[OK]\\033[0m"
  exit 0
else
  echo -e "\\033[0;31m[FAILED]\\033[0m"
  exit 1
fi
