#!/bin/bash

installer "Preparing Desktop environment"

# ######################################
# Temporary folder
# ######################################

action "Creating temporary folder"
if [ ! -d "$HOME/Desktop/Temp" ]; then
  running "Create folder"
  mkdir $HOME/Desktop/Temp
fi


# ######################################
# Screenshot folder
# ######################################

action "Creating screenshot folder"
if [ ! -d "$HOME/Desktop/Screenshots" ]; then
  action "Create folder"
  mkdir $HOME/Desktop/Screenshots
fi

running "Set default screenshot location"



# ######################################
# Background image
# ######################################

action "Setting background image"
osascript -e 'tell application "Finder" to set desktop picture to (POSIX path of (path to home folder)) & "dotfiles/img/wallpaper.jpg" as POSIX file'
