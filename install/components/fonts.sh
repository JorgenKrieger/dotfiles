#!/bin/bash

installer "Setting up fonts"

GOOGLE_FONTS=(
  Lato
  Maven
  Merriweather
  Montserrat
  Noto
  PT_
  Playfair
  Source
  Open
  Roboto
)

for font in "${GOOGLE_FONTS[@]}"; do
  running "Copying $font"
  find $PATH_DOTFILES/fonts/google-fonts -type f -name "$font*.ttf" -exec cp {} /Library/Fonts \;
done

# Developer font
running "Copying Operator Mono"
find $PATH_DOTFILES/fonts/operator-mono -type f -name "*.otf" -exec cp {} /Library/Fonts \;

# Powerline font
running "Copying Operator Mono Nerdfont"
find $PATH_DOTFILES/fonts/operator-mono-nerdfont -type f -name "*.otf" -exec cp {} /Library/Fonts \;
