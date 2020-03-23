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
	eno0_interface="vmbr0"
	eno1_interface="vmbr1"
	eno2_interface="vmbr2"
	eno3_interface="vmbr3"
	eno4_interface="vmbr4"

	if [[ -z "$1" ]]; then
	arp-scan --localnet;
	elif [[ "$1" == "wifi" ]]; then
		arp-scan --interface "$wifi_interface" --localnet
	elif [[ "$1" == "eno1" ]]; then
		arp-scan --interface "$eno1_interface" --localnet
	elif [[ "$1" == "eno2" ]]; then
		arp-scan --interface "$eno2_interface" --localnet
	elif [[ "$1" == "eno3" ]]; then
		arp-scan --interface "$eno3_interface" --localnet
	elif [[ "$1" == "eno4" ]]; then
		arp-scan --interface "$eno4_interface" --localnet
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
		git clone https://github.com/gregorthebigmac/$1
		cd $1
	fi
}

# user-made distro-agnostic aliases
alias bfr='source ~/.bashrc'
alias lnscn='arp-scan --localnet'
alias forget='ssh-keygen -f "/etc/ssh/ssh_known_hosts" -R'
alias gip='curl icanhazip.com'
alias amiup='curl google.com'

# debian-specific aliases
alias install='apt-get install -y'
alias uninstall='apt remove'
alias purge='apt purge'
alias search='apt search'
alias wifils='nmcli d wifi list'
alias wificon='nmcli d wifi connect'
alias show='systemctl status'
alias res='systemctl restart'
alias catbash='cat ~/.bash_aliases'
alias nanobash='nano ~/.bash_aliases'
