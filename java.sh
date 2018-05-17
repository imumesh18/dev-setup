#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

echo -n "Installing Java ..."

# Installing JAVA(Default is JAVA8)
sudo add-apt-repository ppa:webupd8team/java -y > /dev/null 2>&1
sudo apt-get update > /dev/null
sudo apt-get -y install oracle-java8-installer > /dev/null

# Verify and exit installation
JAVA_CHECK="$(java -version 2>&1)"
if [[ "$JAVA_CHECK" == *"Java(TM) SE Runtime Environment"* ]]; then
   echo -e "\\033[0;32m[OK]"
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31m[FAILED]"
   echo -e "\\033[0m"
   exit 1
fi