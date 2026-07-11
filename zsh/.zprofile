#
# Executes commands at login before zshrc.
#
if [[ -z "$LANG" ]]; then
    export LANG='en_US.UTF-8'
    export LANGUAGE=en_US.UTF-8
fi

export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSCHARSET=utf-8

# eliminates duplicates in *paths
typeset -gU cdpath fpath path

# Zsh search path for executable
path=(
  /opt/homebrew/{bin,sbin}
  /usr/local/{bin,sbin}
  $path
)

# Lazy-load nodenv — shims are in PATH via path.sh so node/npm work immediately.
# The full init only runs on first explicit `nodenv` call.
nodenv() {
    unset -f nodenv
    eval "$(command nodenv init - --no-rehash zsh)"
    nodenv "$@"
}
