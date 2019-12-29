#!/bin/bash

installer "Preparing Homebrew"
if [[ $(command -v brew) == "" ]]; then
  action "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ok
else
  action "Updating Homebrew"

  running "brew update"
  brew update

  running "brew upgrade"
  brew upgrade
  ok
fi

action "Installing packages & GUI apps"

running "Tap brew versions"
brew tap homebrew/cask-versions

running "Install brewfile"
brew bundle --file=$PATH_INSTALL/components/Brewfile
