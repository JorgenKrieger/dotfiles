#!/bin/bash

PATH_INSTALL="$( cd "$(dirname "$0")"; pwd -P)"
PATH_DOTFILES="$(dirname "$PATH_INSTALL")"
PATH_DOTS="$PATH_DOTFILES/dots"
PATH_INSTALL="$PATH_DOTFILES/install"
PATH_CONFIGURATIONS="$PATH_DOTFILES/configurations"
PATH_FONTS="$PATH_DOTFILES/fonts"

# Tool output functionality
source $PATH_INSTALL/helpers/colors.sh
installer "Hello world! Dotfiles installer is booting."


# Get sudo access
installer "Let's get sudo access up front"
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Change shell to ZSH
installer "Changing the default shell to ZSH"
chsh -s /bin/zsh
sudo chsh -s /bin/zsh

# Run components
for file in $PATH_INSTALL/components/*.sh; do
  source $file
done

# Setup macOS configurations
for file in $PATH_CONFIGURATIONS/macOS/*.sh; do
  source $file
done

# Setup apps
source $PATH_CONFIGURATIONS/tools/vscode/setup.sh

# Allow Apps from Anywhere
installer "Allow macOS to open apps from anywhere"
sudo spctl --master-disable