# Base system dirs
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

# Homebrew (Apple Silicon)
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# nodenv — shims must be in PATH so node/npm work before nodenv is explicitly called
export PATH=$HOME/.nodenv/bin:$HOME/.nodenv/shims:$PATH

# Composer
export PATH=$HOME/.config/composer/vendor/bin:$PATH

# Local bin
export PATH=$HOME/.local/bin:$PATH

# User bin — highest priority, overrides everything above
export PATH=$HOME/bin:$PATH
