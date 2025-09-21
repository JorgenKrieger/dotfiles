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

# Load separate config files
for conf in "$XDG_CONFIG_HOME/zsh/config.d/"*.sh; do
    # shellcheck source=/dev/null
	source "${conf}"
done
unset conf

# Load starship theme
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"
eval "$(starship init zsh)"
