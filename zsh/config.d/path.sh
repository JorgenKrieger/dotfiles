# Start with a clean base path -- system dirs only
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH

# Add Homebrew (Apple Silicon) first, so it overrides system
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# Add custom user bin last, so it overrides all others
export PATH=$HOME/bin:$PATH