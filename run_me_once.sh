#!/bin/bash

# Remove Proxmox enterprise repo. It's the only file in this directory, by default.
cd /etc/apt/sources.list.d/ && rm -rf ./*

# Add Proxmox free updates to apt repo.
cd /etc/apt/
echo "
# Proxmox FREE updates
deb http://download.proxmox.com/debian/pve buster pve-no-subscription" \
>> /etc/apt/sources.list

# Replace .bashrc with this one
cat bashrc > ~/.bashrc

# Run one-time updates and install git and curl, and then reboot.
apt-get update \
&& apt upgrade -y \
&& apt autoremove -y \
&& apt-get install -y curl \
&& apt-get install -y git \
&& reboot
