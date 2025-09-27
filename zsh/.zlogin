#!/usr/bin/env zsh

# Execute code in the background to not affect the current session
(
    setopt LOCAL_OPTIONS EXTENDED_GLOB
    autoload -U zrecompile

    # Compile all zsh-related files into bytecode
    # Next time the terminal opens, zsh loads the precompiled files instead of parsing them fresh
    zcompdump="${ZSH_DIR:-$HOME}/.zcompdump"
    if [[ -s "$zcompdump" && (! -s "${zcomppdump}.zwc" || "$zcompdump" -nt "${zcomppdump}.zwc") ]]; then
        zrecompile -pq "$zcompdump"
    fi

    # zcompile .zshrc
    zrecompile -pq ${ZSH_DIR:-${HOME}}/.zshrc
    zrecompile -pq ${ZSH_DIR:-${HOME}}/.zprofile
    zrecompile -pq ${ZSH_DIR:-${HOME}}/.zshenv

    # recompile all zsh or sh
    for f in $ZSH_DIR/**/*.sh; do
        zrecompile -pq $f
    done
) &!