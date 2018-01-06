#!/usr/bin/env bash

#Exit on error
set -e

sudo -v

#INSTALL DEPENDENCIES

#To allow using https as well as http in apt repository sources
sudo apt-get update && apt-get install -y apt-transport-https

#Docker dependencies
sudo apt install docker.io -y

#To start and enable the Docker service
sudo systemctl start docker

sudo systemctl enable docker

#INSTALL KUBERNETES

#To download and add key for the Kubernetes
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add 

echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

#Install Kubernetes

sudo apt update -y

sudo apt install -y kubelet kubeadm kubectl kubernetes-cni
