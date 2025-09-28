#!/usr/bin/env zsh

#-----------------------------------------------------
# For profiling (debugging) zsh
# https://unix.stackexchange.com/a/329719/27109
#
#zmodload zsh/zprof


#-----------------------------------------------------
# Zsh Initialize
if [[ -s ${ZSH_DIR}/_init.sh ]]; then
    source "${ZSH_DIR}/_init.sh"
fi

#-----------------------------------------------------

# Tab completion
# https://gist.github.com/ctechols/ca1035271ad134841284
# https://carlosbecker.com/posts/speeding-up-zsh
#
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' "$ZSH_DIR"/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# Case insensitive autocomplete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Load separate config files
for conf in "$XDG_CONFIG_HOME/zsh/config.d/"*.sh; do
    # shellcheck source=/dev/null
	source "${conf}"
done
unset conf

# Load starship theme
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"
eval "$(starship init zsh)"


# Set DOTFILES to the root of the dotfiles repo
export DOTFILES=$(cd "$(dirname "$(realpath "${(%):-%x}")")/.." && pwd)


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/jorgen/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP binary.
export PATH="/Users/jorgen/Library/Application Support/Herd/bin/":$PATH
