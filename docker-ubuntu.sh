#!/usr/bin/env bash

#Exit on error
set -e

sudo -v

#Add the GPG key for the official Docker repository to the system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#Update the package database with Docker packages from the newly added repo
sudo apt update -y

#To install from the Docker repo instead of the default Ubuntu16.04 repo
apt-cache policy docker-ce

#Install Docker
sudo apt-get install -y docker-ce

#To check the docker version
DOCKER_VERSION="$(docker -v)"
if [[ "$DOCKER_VERSION" == "Docker version 17."* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Hoorrayy!!! Docker is successfully installed!"
   echo
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Oops! There seems to be some problem. Please try to fix it or report an issues"
   echo -e "\\033[0m"
   exit 1
fi
