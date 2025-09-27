#!/usr/bin/env zsh

# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
skip_global_compinit=1

# http://disq.us/p/f55b78
setopt noglobalrcs

# Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export ZSH_DIR="$XDG_CONFIG_HOME/zsh"

# Dynamically determine dotfiles path from symlink
if [[ -L "$HOME/bin/dotfiles" ]]; then
    # Get the target of the symlink
    SYMLINK_PATH="$(readlink "$HOME/bin/dotfiles")"
    if [[ "$SYMLINK_PATH" = /* ]]; then
        # Absolute path in symlink
        export PATH_DOTFILES="${SYMLINK_PATH:h}"
    else
        # Relative path in symlink (relative to ~/bin)
        export PATH_DOTFILES="$HOME/bin/${SYMLINK_PATH:h}"
    fi
else
    # Fallback to default path if symlink doesn't exist
    export PATH_DOTFILES="$HOME/dotfiles"
fi

# ZSH Settings
export HISTFILE="$ZSH_DIR/.zsh_history"    # History filepath
export HISTSIZE=10000                      # Maximum events for internal history
export SAVEHIST=10000                      # Maximum events in history file

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZSH_DIR:-$HOME}/.zprofile" ]]; then
  source "${ZSH_DIR:-$HOME}/.zprofile"
fi
