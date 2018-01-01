#!/usr/bin/env bash

#Exit on error
set -e

sudo -v

#INSTALL GO LANGUAGE

sudo apt install golang-go -y

#Download the Go language binary archive file
wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz

#Extract the downloaded archive 
sudo tar -xvf go1.9.2.linux-amd64.tar.gz

#install it to the /usr/local directory
sudo mv go /usr/local

#SETUP GO ENVIRONMENT

#location where Go package is installed on your system
sudo echo "export GOROOT=/usr/local/go" | sudo tee -a ~/.profile

#location of your work directory
sudo echo "export GOPATH=$HOME" | sudo tee -a ~/.profile

#to access go binary system wide
sudo echo "export PATH=$PATH:/usr/local/go/bin" | sudo tee -a ~/.profile

#VERIFY INSTALLATION

echo -n "Verifying Golang installation... "
echo
GO_VERSION="$(go version)"
if [[ "$GO_VERSION" ==  "go version go1.9.2 linux/amd64" ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Golang is successfully installed!"
   echo
   go version
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! Something went wrong, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi



