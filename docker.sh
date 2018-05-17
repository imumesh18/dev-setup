#!/usr/bin/env bash

#Exit on error
set -e

sudo -v

echo -n "Installing Docker ..."

# Update the package list
sudo apt-get update > /dev/null

# Install Dependency
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common > /dev/null

# Add the GPG key for the official Docker repository to the system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null 2>&1

# Verify the Docker GPG key
KEY_FINGERPRINT="$(sudo apt-key fingerprint 0EBFCD88)"

if [[ "$KEY_FINGERPRINT" == *"9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"* ]]; then :
else
   exit 1
fi

#Add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#Update the package database with Docker packages from the newly added repo
sudo apt-get update -y > /dev/null

#Install Docker
sudo apt-get install -y docker-ce /dev/null

# Verify and exit installation
DOCKER_VERSION="$(docker -v)"
if [[ "$DOCKER_VERSION" == "Docker version"* ]]; then
   echo -e "\\033[0;32m[OK]"
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31m[FAILED]"
   echo -e "\\033[0m"
   exit 1
fi