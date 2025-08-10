# Paths
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh/custom"
export PATH_DOTFILES="$HOME/dotfiles"

# Equivalent to oh-my-zsh defaults
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

# Tab completion
autoload -Uz compinit
compinit

# Load seperate config files
for conf in "$XDG_CONFIG_HOME/zsh/config.d/"*.sh; do
	source "${conf}"
done
unset conf

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load starship theme
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"
eval "$(starship init zsh)"