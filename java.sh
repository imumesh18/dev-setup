#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

echo -n "Installing Java ..."

Distribution_ID="$(lsb_release -is)"
Codename="$(lsb_release -cs)"

if [ "$(Distribution_ID)" == "Debian" ]; then
  Codename="xenial"
  Distribution_ID="debian"
else
  Distribution_ID="ubuntu"
fi

# Add webupd8team java package
sudo sh -c "echo 'deb [arch=amd64] http://ppa.launchpad.net/webupd8team/java/ubuntu ${Codename} main' > /etc/apt/sources.list.d/webupd8team-${Distribution_ID}-java-${Codename}.list"
sudo sh -c "echo 'deb [arch=amd64] http://ppa.launchpad.net/webupd8team/java/ubuntu ${Codename} main' > /etc/apt/sources.list.d/webupd8team-${Distribution_ID}-java-${Codename}.list.save"

# Add gpg key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7B2C3B0889BF5709A105D03AC2518248EEA14886 >/dev/null 2>&1

# Installing JAVA(Default is JAVA8)
sudo apt-get update >/dev/null
sudo apt-get -y install oracle-java8-installer >/dev/null

# Verify and exit installation
JAVA_CHECK="$(java -version 2>&1)"
if [[ "$JAVA_CHECK" == *"Java(TM) SE Runtime Environment"* ]]; then
  echo -e "\\033[0;32m[OK]\\033[0m"
  exit 0
else
  echo -e "\\033[0;31m[FAILED]\\033[0m"
  exit 1
fi
