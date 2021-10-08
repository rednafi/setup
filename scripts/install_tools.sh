#!/usr/bin/env bash

# Bash strict mode.
set -euo pipefail

# Tool names.

apt_tools="curl \
dnsutils \
jq \
nano \
net-tools \
telnet \
htop \
code \
dbeaver-ce
"

snap_tools="postman \
docker"

# Log color.
green="\033[0;32m"
clear="\033[0m"

printf "${green}The following set of tools will be installed:${clear}\n"
printf "${green}=============================================${clear}\n"
echo
echo $apt_tools $snap_tools | xargs -n1 echo "- "
echo

## Install build dependencies.
printf "${green}Installing misc tools...${clear}\n"
printf "${green}========================${clear}\n"
echo
    sudo apt install -y $apt_tools
    sudo snap install $snap_tools
echo

# Post docker installation steps.
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo snap disable docker
sudo snap enable docker



