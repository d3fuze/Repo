#!/bin/bash

#Add Parrot's Repo to your Sources
echo 'deb https://deb.parrot.sh/parrot/ parrot main contrib non-free' | sudo tee -a /etc/apt/sources.list

#Download Parrot's Public Key
wget 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8b4060ca69a97356b2dcf551823bf07ceb5c469b' -O parrot.gpg

#Read the public key, convert to raw, and add to the trusted public keystore
cat ./parrot.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/parrot.gpg

#Update Repo and install Snort
sudo apt update && sudo apt install snort -y 

#Run Snort
sudo snort -vde -c /etc/snort/snort.conf
