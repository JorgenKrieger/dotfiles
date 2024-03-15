# Paths
export OSH="$HOME/.config/shell/bash/oh-my-bash"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH_DOTFILES="$HOME/jorgenkrieger/dotfiles"

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable. The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# Which completions would you like to load?
# https://github.com/ohmybash/oh-my-bash/tree/master/completions
# Add wisely, as too many completions slow down shell startup.
completions=(
  docker
  gh
  git
  npm
  ssh
)

# Which plugins would you like to load?
# https://github.com/ohmybash/oh-my-bash/tree/master/plugins
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  xterm
)

# Load seperate config files
for conf in "$XDG_CONFIG_HOME/shell/config.d/"*.sh; do
	source "${conf}"
done
unset conf

# Load oh-my-bash
source "$OSH"/oh-my-bash.sh

# Load starship theme
eval "$(starship init bash)"