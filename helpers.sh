#!/bin/bash

# Return operating system
os() {
	if [[ "$OSTYPE" == "linux-gnu" ]]; then
		# Linux
		local DISTRIB=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
		if [[ ${DISTRIB} == *"Ubuntu"* ]]; then
			# Ubuntu
			if uname -a | grep -q '^Linux.*microsoft'; then
				# WSL Ubuntu
				echo "WSL Ubuntu"
				return
			else
				# Native Ubuntu
				echo "Native Ubuntu"
				return
			fi

		elif [[ ${DISTRIB} == *"Debian"* ]]; then
			# Debian
			echo "Debian"
			return
		fi

		echo "Linux"

	elif [[ "$OSTYPE" == "darwin"* ]]; then
		# Mac
		echo "Mac"
	fi
}

set_dns() {
	yellow Please select a DNS provider
	echo '1) 1.1.1.1 for Families'
	echo '2) Google Public DNS'
	echo '0) System default'
	read -p 'Enter choice: ' PREFERRED_DNS

	case $PREFERRED_DNS in
		1)
			local IPS="1.1.1.3 1.0.0.3 2606:4700:4700::1113 2606:4700:4700::1003"
			;;
		2)
			local IPS="8.8.8.8 8.8.4.4 2001:4860:4860::8888 2001:4860:4860::8844"
			;;
		0)
			local IPS="\"Empty\""
			;;
		*)
			red Invalid DNS provided, skipping this part of the setup
			return
			;;
	esac

	sudo networksetup -setdnsservers Wi-Fi $IPS
}

# Color variables
color_red='\033[1;31m'
color_green='\033[1;32m'
color_yellow='\033[0;33m'
color_blue='\033[1;34m'
color_magenta='\033[0;35m'
color_cyan='\033[1;36m'
color_gray='\033[1;30m'
# Bold
font_bold='\033[1m'
# Clear the color after that
clear='\033[0m'

# Colorized output functions
red()     { echo -e "${color_red}$@${clear}"; }
green()   { echo -e "${color_green}$@${clear}"; }
yellow()  { echo -e "${color_yellow}$@${clear}"; }
blue()    { echo -e "${color_blue}$@${clear}"; }
magenta() { echo -e "${color_magenta}$@${clear}"; }
cyan()    { echo -e "${color_cyan}$@${clear}"; }
gray()    { echo -e "${color_gray}$@${clear}"; }
bold()    { echo -e "${font_bold}$@${clear}"; }