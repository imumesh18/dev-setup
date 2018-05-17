#!/usr/bin/env bash

#Exit on error
set -e

sudo -v

echo -n "Installing Golang ..."

# Declare Golang Version
GOLANG_VERSION=1.10.2

# Remove go folder if it already exists
if [ -d "/usr/local/go" ]; then
  sudo rm -rf /usr/local/go
fi

# Download the Go language binary archive file
curl -sSL https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz -o go${GOLANG_VERSION}.linux-amd64.tar.gz

# Extract the downloaded archive
sudo tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz

# SETUP GO ENVIRONMENT

# Location of your work directory
echo "export GOPATH=$HOME/go" | sudo tee -a ~/.profile > /dev/null

# To access go binary system wide
echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin" | sudo tee -a ~/.profile > /dev/null

# Refresh Profile
# shellcheck source=/dev/null
source ~/.profile 

# Clean up
rm -rf go${GOLANG_VERSION}.linux-amd64.tar.gz

# VERIFY INSTALLATION
GO_VERSION="$(go version)"
if [[ "$GO_VERSION" ==  "go version go${GOLANG_VERSION} linux/amd64" ]]; then
   echo -e "\\033[0;32m[OK]\\033[0m"
   exit 0
else
   echo -e "\\033[0;31m[FAILED]\\033[0m"
   exit 1
fi
