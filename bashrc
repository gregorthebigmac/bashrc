# user-made functions
function scan() {
	# Be sure to change the following interface variable values to that
	# of your actual interface names!
	wifi_interface="wlx04a1517077dc"
	eno1_interface="enp0s25"
	eno2_interface="enp4s0"
	eno3_interface=""
	eno4_interface=""

	if [[ -z "$1" ]]; then
	sudo arp-scan --localnet;
	elif [[ "$1" == "wifi" ]]; then
		sudo arp-scan --interface "$wifi_interface" --localnet
	elif [[ "$1" == "eno1" ]]; then
		sudo arp-scan --interface "$eno1_interface" --localnet
	elif [[ "$1" == "eno2" ]]; then
		sudo arp-scan --interface "$eno2_interface" --localnet
	elif [[ "$1" == "eno3" ]]; then
		sudo arp-scan --interface "$eno3_interface" --localnet
	elif [[ "$1" == "eno4" ]]; then
		sudo arp-scan --interface "$eno4_interface" --localnet
	fi
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

function gitclone() {
	if [[ -z "$1" ]]; then
		echo "I need a name for the repo as arg!"
	else
		cd ~/git_repos
		git clone https://github.com/gregorthebigmac/$1
		cd $1
	fi
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
