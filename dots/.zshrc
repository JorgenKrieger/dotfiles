export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=$HOME/dotfiles/configurations/zsh

ZSH_THEME="spaceship"
DEFAULT_USER=$(whoami)

plugins=(docker git extract zsh-syntax-highlighting)

# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Paths
export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="/Applications/Sketch.app/Contents/Resources/sketchtool/bin/sketchtool:$PATH"

# Global settings
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
source $HOME/.aliases