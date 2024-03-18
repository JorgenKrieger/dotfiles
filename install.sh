#!/bin/bash

source helpers.sh

# Help function
if [ "$1" = "--help" ]; then
	cyan "\nDotfiles"
	echo -e "This script installs all desired parts of my personal setup."
	echo -e "Everything goes automatically, but there's some flags to make life easier.\n"

	yellow "Generic"
	echo -e "--ignore-brew       $(gray "|") Skips all Homebrew related parts"
	echo -e "--ignore-symlinks   $(gray "|") Skips symlinking dotfiles"
	echo -e "--ignore-git        $(gray "|") Skips setting up Git globals"

	yellow "\nWSL Specific"
	echo -e "--ignore-terminal   $(gray "|") Skips prompting terminal question"

	yellow "\nMac Specific"
	echo -e "--ignore-dns        $(gray "|") Skips DNS setup"
	echo -e "--ignore-hosts      $(gray "|") Skips hosts file setup"
	exit
fi

clear

# Start installer
cyan "Dotfiles installer"
echo -e "Detected system: $(os)"

# Prepare flag checks
ignore_brew=false
ignore_symlinks=false
ignore_terminal=false
ignore_dns=false
ignore_hosts=false
ignore_git=false

for arg in "$@"; do
	if [ "$arg" = "--ignore-brew" ]; then
		ignore_brew=true
		echo -e "$(gray ">") $(yellow "Skipping Homebrew")"
	elif [ "$arg" = "--ignore-symlinks" ]; then
		ignore_symlinks=true
		echo -e "$(gray ">") $(yellow "Skipping Symlinks")"
	elif [ "$arg" = "--ignore-terminal" ]; then
		ignore_terminal=true
		echo -e "$(gray ">") $(yellow "Skipping terminal prompt")"
	elif [ "$arg" = "--ignore-dns" ]; then
		ignore_dns=true
		echo -e "$(gray ">") $(yellow "Skipping DNS setup")"
	elif [ "$arg" = "--ignore-hosts" ]; then
		ignore_hosts=true
		echo -e "$(gray ">") $(yellow "Skipping hosts file")"
	elif [ "$arg" = "--ignore-git" ]; then
		ignore_git=true
		echo -e "$(gray ">") $(yellow "Skipping git setup")"
	fi
done

# Generic install, this will install on every system
bold "\nOS indepenant section"
# TODO: Check what happens on Windows

# Create .config folder
if [ ! -d $HOME/.config ]; then
	yellow Creating .config/
	mkdir $HOME/.config
fi

if [ "$ignore_symlinks" = false ]; then
	yellow "\nSymlinking..."
	for folder in ./cli/*; do
		echo -e "$(gray ">") $(basename "$folder") -> $(blue "$HOME/.config/$(basename "$folder")")"
		ln -nfs $(realpath "$folder") $HOME/.config/
	done

	# Global gitignore
	echo -e "$(gray ">") ".gitignore_global" -> $(blue "$HOME/.config/git/.gitignore_global")"
	ls -nfs $(realpath ./git/.gitignore_global) $HOME/.config/git/.gitignore_global

	# Shell
	# - ZSH config
	mkdir -p $HOME/.config/zsh
	ln -nfs $(realpath shell/zsh/.zshrc) $HOME/.zshrc
	ln -nfs $(realpath shell/zsh/oh-my-zsh) $HOME/.config/zsh/
	mkdir -p $HOME/.config/zsh/custom/plugins
	ln -nfs $(realpath shell/zsh/custom/zsh-syntax-highlighting) $HOME/.config/zsh/custom/plugins/

	# - Bash config
	mkdir -p $HOME/.config/bash
	ln -nfs $(realpath shell/bash/.bashrc) $HOME/.bashrc
	ln -nfs $(realpath shell/bash/oh-my-bash) $HOME/.config/

	# - Generic shell config
	ln -nfs $(realpath shell/config.d) $HOME/.config/

	# - Starship config
	ln -nfs $(realpath shell/starship.toml) $HOME/.config/
fi

if [ "$ignore_brew" = false ]; then
	# - Install Homebrew
	if [[ $(command -v brew) == "" ]]; then
		yellow "Installing Homebrew..."
		curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
	else
		yellow Updating Homebrew...
		brew update
	fi

	# - Install generic brews
	yellow "Installing brews..."
	brew bundle
fi

# Setup git preferences
if [ "$ignore_git" = false ]; then
	bold "\nSetting up git config"
	read -p $'User name: ' GIT_USERNAME
	git config --global user.name $GIT_USERNAME
	read -p $'Email address: ' GIT_EMAIL
	git config --global user.email $GIT_EMAIL
	git config --global color.diff always
	git config --global push.default current
	git config --global push.autoSetupRemote true
	git config --global pull.default current
	git config --global pull.ff only
	git config --global merge.ff only
	git config --global merge.conflictstyle diff3
	git config --global checkout.defaultRemote origin
	git config --global init.defaultBranch main
	git config --global core.excludesfile "$HOME/.config/git/.gitignore_global"
fi


# OS specific setup
if [[ $(os) == "Mac" ]]; then
	bold "\n$(os) specific setup"

	# Mac specific Brew
	if [ "$ignore_brew" = false ]; then
		yellow "Installing brews..."
		brew bundle --file=macos/Brewfile
	fi

	# Symlinks
	if [ "$ignore_symlinks" = false ]; then
		ln -nfs $(realpath macos/.hammerspoon) $HOME/.config/hammerspoon	
	fi

	# Set DNS
	# Using helper functions for cleaner variable storage
	if [ "$ignore_dns" = false ]; then
		set_dns
	fi

	# Hammerspoon
	yellow "Preparing Hammerspoon..."
	defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
	ln -nfs $PWD/macos/.hammerspoon $HOME/.config/hammerspoon

	# Add Dan Pollock's hosts blacklist
	if [ "$ignore_hosts" = false ]; then
        yellow "Set /etc/hosts..."
		sudo mv /etc/hosts /etc/hosts.bak
		sudo curl https://someonewhocares.org/hosts/hosts --output /etc/hosts
	fi

	# Create personal folders
    yellow "Create desktop folders"
	mkdir $HOME/Desktop/Temp
	mkdir $HOME/Desktop/Screenshots
    yellow "Set screenshot location"
	defaults write com.apple.screencapture location ~/Desktop/Screenshots

	# Setup Mac defaults
    yellow "Setting macOS defaults"
	source macos/macOS-defaults.sh


    # Symlink 1password agent for universal usage
    yellow "Symlinking 1password"
    mkdir -p ~/.1password
    ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock

elif [[ $(os) == "WSL Ubuntu" ]]; then
	bold "\n$(os) specific setup"

	# Install WSL specific brews
	if [ "$ignore_brew" = false ]; then
		yellow "Installing brews..."
		brew bundle --file=wsl/Brewfile
	fi

	# Symlinks
	if [ "$ignore_symlinks" = false ]; then
		yellow "\nSymlinking..."
		for file in ./wsl/.*; do
			if [ "$file" = "./wsl/." ] || [ "$file" = "./wsl/.." ]; then
				continue
			fi

			# ln -nfs $PWD/$file
			echo -e "$(gray ">") $(basename "$file") -> $(blue "$HOME/$(basename "$file")")"
			ln -nfs $(realpath "$file") $HOME/
		done
	fi

	# Windows Terminal colorscheme
	if [ "$ignore_colorscheme" = false ]; then
		read -p $'\nDo you want to install the Everblush color theme for Windows Terminal? '"$(gray "(y|n) ")" COLORSCHEME_COPY

		case $COLORSCHEME_COPY in
			y)
				curl -s https://raw.githubusercontent.com/Everblush/terminal-emulators/main/src/windows-terminal/Everblush.json | clip.exe
				gray "> $(green "Everblush theme copied to clipboard")"
				;;
			*)
				gray "> $(yellow Skipping)"
				;;
		esac
	fi
else
	red OS not supported at this point
fi

green "\nInstaller completed, enjoy your system!"
