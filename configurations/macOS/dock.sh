#!/bin/bash

installer "Preparing the dock"

running "Remove all dock icons"
dockutil --no-restart --remove all

function dock(){
  running "$1"
  dockutil --no-restart --add "$2/Applications/$1.app"
}

# Mac apps
dock "Safari"
dock "Music" "/System"
dock "App Store" "/System"
dock "System Preferences" "/System"

# Project management apps
dock "Spark"
dock "Notion"

# Communication apps
dock "Slack"
dock "WhatsApp"
dock "Skype"
dock "KakaoTalk"
dock "LINE"

# Dev apps
dock "Microsoft Edge Dev"
dock "iTerm"
dock "Visual Studio Code"
dock "Sequel Pro"

# Design apps
dock "Sketch"


running "Downloads folder"
dockutil --add '~/Downloads' --view fan --display folder --allhomes

running "Small spacers"
for i in {1..3}; do
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
done

warn "Don't forget to relocate the spacers"
