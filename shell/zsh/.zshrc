# Paths
export ZSH="$HOME/.config/zsh/oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/zsh/custom"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH_DOTFILES="$HOME/dotfiles"

# Load seperate config files
for conf in "$XDG_CONFIG_HOME/shell/config.d/"*.sh; do
	source "${conf}"
done
unset conf

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load starship theme
eval "$(starship init zsh)"