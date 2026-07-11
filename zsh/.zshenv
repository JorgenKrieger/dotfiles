#!/usr/bin/env zsh

# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
skip_global_compinit=1

# http://disq.us/p/f55b78
setopt noglobalrcs

# Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export ZSH_DIR="$XDG_CONFIG_HOME/zsh"

# Dotfiles repo root, resolved from this file's real path
export DOTFILES=$(cd "$(dirname "$(realpath "${(%):-%x}")")/.." && pwd)

# Starship config
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"

# ZSH Settings
export HISTFILE="$ZSH_DIR/.zsh_history"    # History filepath
export HISTSIZE=10000                      # Maximum events for internal history
export SAVEHIST=10000                      # Maximum events in history file

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZSH_DIR:-$HOME}/.zprofile" ]]; then
  source "${ZSH_DIR:-$HOME}/.zprofile"
fi
