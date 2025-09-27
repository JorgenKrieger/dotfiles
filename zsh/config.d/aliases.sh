#!/usr/bin/env zsh

# System
alias shutdown="sudo shutdown now"
alias reboot="sudo reboot"
alias suspend="sudo pm-suspend"

# Improved shell UX
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias grep='grep --color=auto'
alias l="eza --all --long --header --no-permissions --octal-permissions --no-user --group-directories-first --time-style=relative --classify=always"
alias ls="eza --all --long --header --no-permissions --octal-permissions --no-user --group-directories-first --time-style=relative --classify=always"
alias tree="eza --tree --level=2 --group-directories-first -F"
alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo OneHalfDark || echo OneHalfLight)"
alias vim="nvim"

# Git
alias status="git status"
alias commit="git commit"
alias amend="git commit --amend"
alias add="git add"
alias pull="git pull"
alias push="git push"
alias stash="git stash"
alias pop="git stash pop"

# Applications
alias arc="open -a Arc"
alias safari="open -a Safari"

# Helper functions
alias clear-dns="sudo killall -HUP mDNSResponder"
alias ip="dig +short myip.opendns.com @resolver4.opendns.com"
alias reload="source $HOME/.zshrc"

# Functions
ghpr() {
	gh pr create --base ${1:-development} --web
}

# Brew override
brew() {
    # Detect the --no-bundle flag and remove it from arguments
    local no_bundle=false
    local args=()

    for arg in "$@"; do
        if [[ "$arg" == "--no-bundle" ]]; then
            no_bundle=true
        else
            args+=("$arg")
        fi
    done

    # Run the real brew command
    command brew "${args[@]}"

    # Skip Brewfile updates if --no-bundle is set
    if [[ "$no_bundle" == true ]]; then
        return
    fi

    # Brewfile path
    local brewfile=$DOTFILES/Brewfile

    # Extract command and package list
    local cmd="${args[0]}"
    local packages=("${args[@]:1}")

    for pkg in "${packages[@]}"; do
        # Skip empty package names
        [[ -z "$pkg" ]] && continue

        # Detect if it is a cask
        if command brew info --cask "$pkg" &>/dev/null 2>&1; then
            local line="cask \"$pkg\""
        else
            local line="brew \"$pkg\""
        fi

        case "$cmd" in
        install)
            # Avoid duplicates
            grep -qxF "$line" "$brewfile" 2>/dev/null || echo "$line" >> "$brewfile"
            # Sort Brewfile alphabetically
            sort -o "$brewfile" "$brewfile"
            ;;
        uninstall)
            # Remove line from Brewfile
            if [[ -f "$brewfile" ]]; then
                sed -i '' "/^$(printf '%s\n' "$line" | sed 's/[]\/$*.^[]/\\&/g')$/d" "$brewfile"
            fi
            ;;
        esac
    done
}