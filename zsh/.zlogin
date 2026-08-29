#!/usr/bin/env zsh

# Execute code in the background to not affect the current session
(
    setopt LOCAL_OPTIONS EXTENDED_GLOB
    autoload -U zrecompile

    # Drop bytecode compiled by another zsh version/binary, otherwise
    # zrecompile prints "zwc file has wrong version" to stderr on every
    # login before rebuilding it.
    for zwc in ${ZSH_DIR:-$HOME}/**/*.zwc(N.); do
        zcompile -t "$zwc" 2>/dev/null || rm -f "$zwc"
    done

    # Compile all zsh-related files into bytecode
    # Next time the terminal opens, zsh loads the precompiled files instead of parsing them fresh
    zcompdump="${ZSH_DIR:-$HOME}/.zcompdump"
    if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
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