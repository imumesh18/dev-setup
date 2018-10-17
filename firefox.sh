#!/usr/bin/env bash

#Exit on error
set -e

echo -n "Installing Firefox browser..."

# Update the package list
sudo apt-get update > /dev/null

cd /tmp/

#Download Latest version of Firefox
wget -L -O firefox.tar.bz2 'https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US'

#Untar the tar ball named firefox.tar.bz2 into your home directory
tar xvf firefox.tar.bz2 -C $HOME

#Start Firefox from the CLI
~/firefox/firefox

#Verify the firefox version
firefox --version
