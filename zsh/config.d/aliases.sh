# Improved shell UX
alias -="cd -"
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

updates() {
	# Homebrew
	if command -v brew &> /dev/null; then
		brew update
		brew upgrade
		brew cleanup
	fi

	# TLDR
	if command -v tldr &> /dev/null; then
		tldr --update
	fi
}