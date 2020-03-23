#!/bin/bash

# Remove Proxmox enterprise repo. It's the only file in this directory, by default.
if cd /etc/apt/sources.list.d; then
	rm -rf ./*
fi

# Add Proxmox free updates to apt repo.
cd /etc/apt/
echo "
# Proxmox FREE updates
deb http://download.proxmox.com/debian/pve buster pve-no-subscription" \
>> sources.list

# Run one-time updates and install git and curl, and then reboot.
apt-get update \
&& apt upgrade -y \
&& apt autoremove -y \
&& apt-get install -y curl \
&& apt-get install -y git \
&& reboot
