#!/bin/bash

# this is a horrible script with zero error checking
# you probably should not use this :)

# pre-reqs
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential python-pip

# Azure CLI
#curl -L https://aka.ms/InstallAzureCli | sudo bash
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
     sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-get update && sudo apt-get install azure-cli

# cleanup
sudo python -m easy_install --upgrade pyOpenSSL
sudo pip install azure
sudo pip install azure-common
sudo pip install msrestazure

# salt
curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh -L -M -N git develop
sudo curl -o /etc/salt/cloud.profiles.d/azure.conf -L https://raw.githubusercontent.com/SWEOU/OSS-offerings/master/salt/cloud.profiles.d/azure.conf
sudo curl -o /etc/salt/cloud.providers.d/azure.conf -L https://raw.githubusercontent.com/SWEOU/OSS-offerings/master/salt/cloud.providers.d/azure.conf
