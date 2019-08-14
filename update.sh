#!/bin/bash

# This script simply automates the process of running full updates on debian-based
# distros, and as of 14 AUG 2019 update to this repo, now includes args for
# further automation (e.g. if you wanted to include this in your own scripts before
# this update, you would have still needed user interaction to respond to the
# prompt of what to do when finished), while still allowing for user interaction
# if no arg is given.

final_command=""

while getopts ':r:p:n:h:' option
do
case "${option}"
in
    r) final_command="reboot";;

    p) final_command="poweroff";;

    n) final_command="nothing";;

    [h\?]) cat << EOF
Usage: sudo update
       sudo update [OPTION]

List of options:

-r      REBOOT when finished
-p      POWEROFF when finished
-h/?    Prints this help message

EOF
    exit 1
    ;;
esac
done

# This may seem a bit over-engineered, so here's a quick breakdown of what it does
# and why. If a valid arg is passed to this script, this entire block is bypassed.
# If no arg is given for what to do when finished, it asks the user what they want
# to do when done running updates, and (assuming the user gives a valid response)
# sets the final_command to either reboot, poweroff, or nothing. If the user enters
# an invalid response, it defaults to nothing.

if [[ -z "$final_command" ]]; then
    echo "what should I do when finished?"
    echo "[r]eboot [p]oweroff [n]othing"
    read final_command
    if [[ "$final_command" == "r" ]]; then
        final_command="reboot"
    elif [[ "$final_command" == "p" ]]; then
        final_command="poweroff"
    elif [[ "$final_command" == "n" ]]; then
        final_command="nothing"
    else
        echo "That wasn't an option, so I'll drop back out to the terminal when finished."
        final_command="nothing"
    fi
# If a valid arg was passed to this script, it skips to this block, and executes
# each portion of the following commands, and if ANY ONE of the commands in the
# string fails, it fails the entire script and dumps an error, telling the user
# which command failed.
# The final string of commands will (effectively) be one of the following scenarios:
# if [invalid arg]: # apt-get update && apt upgrade -y && apt autoremove -y
# if [n]: # apt-get update && apt upgrade -y && apt autoremove -y
# if [r]: # apt-get update && apt upgrade -y && apt autoremove -y && reboot
# if [p]: # apt-get update && apt upgrade -y && apt autoremove -y && poweroff
else
    if apt-get update; then
        if apt upgrade -y; then
            if apt autoremove -y; then
                if [[ "$final_command" == "reboot" ]]; then reboot
                elif [[ "$final_command" == "poweroff" ]]; then poweroff
                elif [[ "$final_command" == "nothing" ]]; then echo "[DONE]"
                else echo "That wasn't an option, so I'll drop back out to the terminal when finished."
                fi
            else
                echo "apt autoremove failed. Exiting..."
                exit 4
            fi
        else
            echo "apt upgrade failed. Exiting..."
            exit 3
        fi
    else
        echo "apt-get update failed. Exiting..."
        exit 2
    fi
fi
