# Lazy shell
alias rmdir="rm -rf"

# GitHub CLI
ghpr() {
	gh pr create --base ${1:-development} --web
}

# ZSH
alias reload="source $HOME/.zshrc"

# Clear DNS cache
alias clear-dns="sudo killall -HUP mDNSResponder"

# CLI tools
alias tree="tree -c"
alias cat="bat"

# Misc
weather() {
	curl wttr.in/"$1"
}

# Browsers
alias arc="open -a Arc"

# IP address
alias ip="dig +short myip.opendns.com @resolver4.opendns.com"

# Dotfiles
alias dotfiles="make --directory $PATH_DOTFILES"

# Updates
alias update="brew update && brew upgrade && omz update && tldr --upgrade"