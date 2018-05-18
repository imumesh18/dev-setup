#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

echo "Installing Themes and Icon ..."

Distribution_ID="$(lsb_release -is)"
Codename="$(lsb_release -cs)"

if [ "$(Distribution_ID)" == "Debian" ]; then
  Codename="xenial"
  Distribution_ID="debian"
else
  Distribution_ID="ubuntu"
fi

# Add adapta-theme package
sudo sh -c "echo 'deb [arch=amd64] http://ppa.launchpad.net/tista/adapta/ubuntu ${Codename} main' > /etc/apt/sources.list.d/tista-${Distribution_ID}-adapta-${Codename}.list"
sudo sh -c "echo 'deb [arch=amd64] http://ppa.launchpad.net/tista/adapta/ubuntu ${Codename} main' > /etc/apt/sources.list.d/tista-${Distribution_ID}-adapta-${Codename}.list.save"

# Add gpg key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EAC0D406E5D79A82ADEEDFDFB76E53652D87398A

# Installing adapta-theme
sudo apt-get update
sudo apt-get install adapta-gtk-theme

# Add pop-theme-icon package
sudo sh -c "echo 'deb [arch=amd64] http://ppa.launchpad.net/system76/pop/ubuntu ${Codename} main' > /etc/apt/sources.list.d/system76-$(lsb_release -is)-pop-${Codename}.list"
sudo sh -c "echo 'deb [arch=amd64] http://ppa.launchpad.net/system76/pop/ubuntu ${Codename} main' > /etc/apt/sources.list.d/system76-$(lsb_release -is)-pop-${Codename}.list.save"

# Add gpg key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E6AC16572ED1AD6F96C7EBE01E5F8BBC5BEB10AE

# Installing Pop-icon-theme
sudo apt update
sudo apt install pop-icon-theme

echo -e "\\033[0;32m[OK]\\033[0m"

echo -n "Setting Up Themes and Icon ..."

# Set Theme and Icon
gsettings set org.gnome.desktop.interface gtk-theme Adapta
gsettings set org.gnome.desktop.interface icon-theme Pop
gsettings set org.gnome.desktop.interface cursor-theme Pop

echo -e "\\033[0;32m[OK]\\033[0m"
