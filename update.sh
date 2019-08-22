#!/bin/bash

echo "what should I do when finished?"
echo "[r]eboot [p]oweroff [n]othing"
read answer

if [[ "$answer" == "r" ]]; then
	apt-get update && apt upgrade -y && apt autoremove -y && reboot
elif [[ "$answer" == "p" ]]; then
	apt-get update && apt upgrade -y && apt autoremove -y && poweroff
elif [[ "$answer" == "n" ]]; then
	apt-get update && apt upgrade -y && apt autoremove -y
else
	echo "That wasn't an option, so I'll drop back out to the terminal when finished."
	apt-get update && apt upgrade -y && apt autoremove -y
fi

