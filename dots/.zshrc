
# Paths
export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="/Applications/Sketch.app/Contents/Resources/sketchtool/bin/sketchtool:$PATH"

# Global settings
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
ALIAS_FOLDER="/dotfiles/dots/.config/zsh/aliases"
for file in $HOME/$ALIAS_FOLDER/*.sh; do
  source $file
done
