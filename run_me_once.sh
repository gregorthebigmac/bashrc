#!/bin/bash

# Remove Proxmox enterprise repo. It's the only file in this directory, by default.
rm -rf /etc/apt/sources.list.d/*

# Add Proxmox free updates to apt repo.
echo "# Proxmox FREE updates" \
>> /etc/apt/sources.list
echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" \
>> /etc/apt/sources.list

# Add lines about .bash_aliases in .bashrc
echo "# if .bash_aliases exists, add it to .bashrc profile" \
>> ~/.bashrc
echo "if [ -f ~/.bash_aliases ]; then" \
>> ~/.bashrc
echo "        . ~/.bash_aliases" \
>> ~/.bashrc
echo "fi" \
>> ~/.bashrc

# Run one-time updates and install git and curl, and then reboot.
apt-get update \
&& apt upgrade -y \
&& apt autoremove -y \
&& apt-get install -y curl \
&& apt-get install -y git \
&& reboot