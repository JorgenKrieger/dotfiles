#!/bin/bash

installer "Setting up fonts"

GOOGLE_FONTS=(
  Archivo
  BioRhyme
  Cardo
  Cormorant
  Exo
  IBM
  Fira
  Karla
  Lato
  Libre
  Lora
  Maven
  Merriweather
  Montserrat
  Muli
  Noto
  Nunito
  Poppins
  PT
  Playfair
  Source
  Spectral
  Titillium
  Open
  Oxygen
  Roboto
  Raleway
  Rubik
  Quicksand
  Vollkorn
  Work
  Ubuntu
)

for font in "${GOOGLE_FONTS[@]}"; do
  running "Copying $font"
  find $PATH_DOTFILES/fonts/google-fonts -type f -name "$font*.ttf" -exec cp {} /Library/Fonts \;
done

# Developer font
running "Copying Operator Mono font"
find $PATH_DOTFILES/fonts/operator-mono -type f -name "*.otf" -exec cp {} /Library/Fonts \;

# Powerline font
running "Copying Operator Mono Nerdfont"
find $PATH_DOTFILES/fonts/operator-mono-nerdfont -type f -name "*.otf" -exec cp {} /Library/Fonts \;
