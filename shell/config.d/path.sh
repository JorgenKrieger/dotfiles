# Base paths
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH

# Homebrew
if [[ "$(uname)" == "Darwin" ]]; then 
	export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
else
	export PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH
fi

# Nodenv
export PATH=$HOME/.nodenv/shims:$PATH

# Pnpm
export PATH=$HOME/Library/pnpm:$PATH
export PNPM_HOME="$HOME/Library/pnpm"

# PostgresQL 16
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Composer
export PATH=$HOME/.config/composer/vendor/bin:$PATH
