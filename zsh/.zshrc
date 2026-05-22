#!/usr/bin/env zsh

# Uncomment to profile startup time
# zmodload zsh/zprof

#-----------------------------------------------------
# Initialize ZSH (autoloaded functions, extended glob, launchctl PATH)
if [[ -s ${ZSH_DIR}/_init.sh ]]; then
    source "${ZSH_DIR}/_init.sh"
fi

#-----------------------------------------------------
# Load modular config files — these may extend fpath and PATH
for conf in "$XDG_CONFIG_HOME/zsh/config.d/"*.sh; do
    source "${conf}"
done
unset conf

#-----------------------------------------------------
# Tab completion — single call, after all fpath additions
# https://gist.github.com/ctechols/ca1035271ad134841284
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' "$ZSH_DIR"/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

#-----------------------------------------------------
# Starship prompt
eval "$(starship init zsh)"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/jorgen/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="/Users/jorgen/Library/Application Support/Herd/config/php/85/"


# Herd injected PHP binary.
export PATH="/Users/jorgen/Library/Application Support/Herd/bin/":$PATH
