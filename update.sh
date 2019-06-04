#!/bin/bash

echo "what should I do when finished?"
echo "[r]eboot [p]oweroff [n]othing"
read answer

if [[ "$1" == "r" ]]; then
	apt-get update && apt upgrade -y && apt autoremove -y && reboot
elif [[ "$1" == "p" ]]; then
	apt-get update && apt upgrade -y && apt autoremove -y && poweroff
elif [[ "$1" == "n" ]]; then
	apt-get update && apt upgrade -y && apt autoremove -y
else
	echo "That wasn't an option, so I'll drop back out to the terminal when finished."
	apt-get update && apt upgrade -y && apt autoremove -y
fi
