# user-made functions
function scan() {
	sudo arp-scan --interface "$1" --localnet;
}

function srch() {
	apt search "$1" | more
}

function build() {
	output_file="$1"
	extension=".cpp"
	input_file=$output_file$extension
	g++ $input_file -o $output_file
}

# user-made distro-agnostic aliases
alias las='ls -la --color --group-directories-first | more'
alias bfr='source ~/.bashrc'
alias lnscn='sudo arp-scan --localnet'
alias forget='ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R'
alias gip='curl icanhazip.com'
alias amiup='curl google.com'

# debian-specific aliases
alias install='sudo apt-get install -y'
alias uninstall='sudo apt remove -y'
alias purge='sudo apt purge -y'
alias search='apt search'
alias sleep='systemctl suspend'
alias wifils='nmcli d wifi list'
alias wificon='nmcli d wifi connect'
alias show='systemctl status'
alias res='sudo systemctl restart'
