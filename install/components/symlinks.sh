#!/bin/bash

shopt -s dotglob

installer "Linking dotfiles"

for file in $PATH_DOTS/*; do
  running "Linking $file"
  ln -nfs $file $HOME/
done
