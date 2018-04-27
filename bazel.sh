#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

echo
JAVA_CHECK="$(java -version 2>&1)"
if [[ "$JAVA_CHECK" == *"Java(TM) SE Runtime Environment"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "Java is installed!"
   echo
   java -version
   echo -e "\\033[0m"
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Installing JAVA"
   # Installing JAVA(Default is JAVA8)
   sudo add-apt-repository ppa:webupd8team/java
   sudo apt-get update
   sudo apt-get -y install oracle-java8-installer
   echo
   java -version
   echo -e "\\033[0m"
fi

# Changes the text color to Light-green.
echo -e "\\033[1;92m"

cat << "EOF"
 _____           _        _ _ _               ____                _ 
|_   _|         | |      | | (_)             |  _ \              | |
  | |  _ __  ___| |_ __ _| | |_ _ __   __ _  | |_) | __ _ _______| |
  | | | '_ \/ __| __/ _` | | | | '_ \ / _` | |  _ < / _` |_  / _ \ |
 _| |_| | | \__ \ || (_| | | | | | | | (_| | | |_) | (_| |/ /  __/ |
|_____|_| |_|___/\__\__,_|_|_|_|_| |_|\__, | |____/ \__,_/___\___|_|
                                       __/ |                        
                                      |___/                         
EOF

# Changes the text color to default
echo -e "\\033[0m"

# Adding Bazel distribution URI as a package source
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

# Update packages and Installs Bazel latest version
sudo apt-get update 
sudo apt-get install bazel -y

# Verify and exit installation
echo "Verifying Bazel installation... "
echo
BAZEL_CHECK="$(bazel version)"
if [[ "$BAZEL_CHECK" == *"Build label"* ]]; then
   echo -e "\\033[0;32mOK"
   echo
   echo "BAZEL is successfully installed!"
   echo
   bazel version
   echo -e "\\033[0m"
   exit 0
else
   echo -e "\\033[0;31mFAILED"
   echo
   echo "$0: Lol! You broke my script dude :)XD, try to fix yourself else report an issues"
   echo -e "\\033[0m"
   exit 1
fi