#!/usr/bin/env zsh

#-----------------------------------------------------
# Ensure to only execute on ZSH
# https://stackoverflow.com/a/9911082/339302
[[ -n $ZSH_VERSION ]] || return

#-----------------------------------------------------
# Load zinit


#-----------------------------------------------------
# Setting autoloaded functions
autoload_dir=${ZSH_DIR}/autoloaded

if [[ -d "$autoload_dir" ]]; then
    fpath=("$autoload_dir" "${fpath[@]}")

    setopt extended_glob
    for f in "$autoload_dir"/*(:t); do
        autoload -Uz "$f"
    done
fi
unset autoload_dir

#-----------------------------------------------------
# Load all scripts

#-----------------------------------------------------
# After all, set the PATH for macOS
[[ -x /bin/launchctl ]] && /bin/launchctl setenv PATH "$PATH"