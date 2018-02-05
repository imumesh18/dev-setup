#!/usr/bin/env bash

#Exit on error
set -e

sudo -v

# Declare Golang Version
GOLANG_VERSION=1.9.2

# Changes the text color to Sky-Blue.
echo -e "\\033[1;38;5;39m"

cat << "EOF"
         ,_---~~~~~----._
  _,,_,*^____      _____``*g*\"*,
 / __/ /'     ^.  /      \ ^@q   f
[  @f | @))    |  | @))   l  0 _/
 \`/   \~____ / __ \_____/    \
  |           _l__l_           I
  }          [______]           I
  ]            | | |            |
  ]             ~ ~             |
  |                            |
   |                           |


EOF

# Changes the text color to default
echo -e "\\033[0m"

# Remove go folder if it already exists
if [ -d "/usr/local/go" ]; then
  sudo rm -rf /usr/local/go
fi

#Download the Go language binary archive file
wget https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz

#Extract the downloaded archive
sudo tar -xvf go${GOLANG_VERSION}.linux-amd64.tar.gz

#install it to the /usr/local directory
sudo mv go /usr/local

#SETUP GO ENVIRONMENT

#location of your work directory
echo "export GOPATH=$HOME/go" | sudo tee -a ~/.profile

#to access go binary system wide
echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin" | sudo tee -a ~/.profile

# Clean up
echo -e "\\033[1;93m**Cleaning Up the mess**\\033[1;93m\\033[0m"
rm -rf go${GOLANG_VERSION}.linux-amd64.tar.gz

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
