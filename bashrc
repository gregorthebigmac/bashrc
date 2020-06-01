# user-made functions
function las() {
	if [[ -z "$1" ]]; then
		ls -la --color --group-directories-first | more
	else ls -la "$1" --color --group-directories-first | more
	fi
}

function scan() {
	# Be sure to change the following interface variable values to that
	# of your actual interface names!
	wifi_interface=""
	eno1_interface=""
	eno2_interface=""
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
	# Be sure to put your software repo in here and modify where necessary
	repo search "$1" | more
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
		git clone https://github.com/gregorthebigmac/$1 --recursive
		cd $1
	fi
}

# user-made distro-agnostic aliases
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
alias catbash='cat ~/.bash_aliases'
alias nanobash='nano ~/.bash_aliases'
