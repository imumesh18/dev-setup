#!/usr/bin/env bash

#Exit on error
set -e

sudo -v

# Update the package list
sudo apt-get update

# Install Dependency
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add the GPG key for the official Docker repository to the system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify the Docker GPG key
# Verify and exit installation
echo "Verifying Docker apt-key fingerprint... "
echo
KEY_FINGERPRINT="$(sudo apt-key fingerprint 0EBFCD88)"

if [[ "$KEY_FINGERPRINT" == *"9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Docker Key Fingerprint Verified!"
   echo
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Docker Key Fingerprint is not Verified!"
   echo -e "\\033[0m"
   exit 1
fi

#Add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#Update the package database with Docker packages from the newly added repo
sudo apt-get update -y

#Install Docker
sudo apt-get install -y docker-ce

# Verify and exit installation
echo "Verifying Docker installation... "
echo
DOCKER_VERSION="$(docker -v)"
if [[ "$DOCKER_VERSION" == "Docker version"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Hoorrayy!!! Docker is successfully installed!"
   echo
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! You broke my script dude :)XD, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi
