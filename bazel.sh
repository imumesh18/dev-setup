#!/usr/bin/env bash

# Exit on error
set -e

sudo -v

JAVA_CHECK="$(java -version 2>&1)"
if [[ "$JAVA_CHECK" == *"Java(TM) SE Runtime Environment"* ]]; then
	echo -n "Installing BazelBuild ..."
else
	# Add webupd8team java package
	sudo sh -c "echo 'deb [arch=amd64] http://ppa.launchpad.net/webupd8team/java/ubuntu $(lsb_release -cs) main' > /etc/apt/sources.list.d/webupd8team-$(lsb_release -is)-java-$(lsb_release -cs).list"

	# Add gpg key
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7B2C3B0889BF5709A105D03AC2518248EEA14886 > /dev/null 2>&1

	# Installing JAVA(Default is JAVA8)
	sudo apt-get update > /dev/null
	sudo apt-get -y install oracle-java8-installer > /dev/null
fi

# Adding Bazel distribution URI as a package source
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list > /dev/null
curl -sSL https://bazel.build/bazel-release.pub.gpg | sudo apt-key add - > /dev/null 2>&1

# Update packages and Installs Bazel latest version
sudo apt-get update > /dev/null
sudo apt-get install bazel -y > /dev/null 2>&1

# Verify and exit installation
BAZEL_CHECK="$(bazel version)"
if [[ "$BAZEL_CHECK" == *"Build label"* ]]; then
	echo -e "\\033[0;32m[OK]\\033[0m"
	exit 0
else
	echo -e "\\033[0;31m[FAILED]\\033[0m"
   	exit 1
fi