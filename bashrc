# user-made functions
function scan() {
	sudo arp-scan --interface "$1" --localnet;
}

function srch() {
	apt search "$1" | more
}

# user-made aliases are below
alias las='ls -la --color --group-directories-first | more'
alias bfr='source ~/.bashrc'
alias update='sudo apt-get update && sudo apt upgrade -y && sudo apt autoremove -y'
alias install='sudo apt-get install -y'
alias uninstall='sudo apt remove -y'
alias search='apt search'
alias sleep='systemctl suspend'
alias lnscn='sudo arp-scan --localnet'
alias wifils='nmcli d wifi list'
alias wificon='nmcli d wifi connect'
alias forget='ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R'
alias gip='curl icanhazip.com'
alias amiup='curl google.com'
