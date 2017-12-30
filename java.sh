#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

# # Purge OpenJDK if the option was provided
# 
# echo "Purging OpenJDK... "
# apt-get purge -q openjdk-\*
# 

# Changes the text color to Light-green.
echo -e "\\033[1;91m"

cat << "EOF"
 ___           _        _ _ _                   _                  
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _      | | __ ___   ____ _ 
 | || '_ \/ __| __/ _` | | | | '_ \ / _` |  _  | |/ _` \ \ / / _` |
 | || | | \__ \ || (_| | | | | | | | (_| | | |_| | (_| |\ V / (_| |
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, |  \___/ \__,_| \_/ \__,_|
                                    |___/                          
EOF

# Changes the text color to default
echo -e "\\033[0m"

# Installing JAVA(Default is JAVA8)
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer

# Verify and exit installation
echo -n "Verifying Java installation... "
echo
JAVA_CHECK="$(java -version 2>&1)"
if [[ "$JAVA_CHECK" == *"Java(TM) SE Runtime Environment"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Java is successfully installed!"
   echo
   java -version
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! Something went wrong, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi