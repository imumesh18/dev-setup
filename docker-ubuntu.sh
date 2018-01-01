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
docker version
