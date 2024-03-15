# Lazy shell
alias rmdir="rm -rf"

alias l="ls -lah"
alias la="ls -lAh"
alias ll="ls -lh"
alias ls="ls --color=tty"
alias lsa="ls -lah"

# GitHub CLI
ghpr() {
	gh pr create --base ${1:-development} --web
}

# ZSH
reload() {
	local shell=$(ps -p $$)
	if [[ "$shell" =~ .*"zsh".* ]]; then
		source $HOME/.zshrc
	elif [[ "$shell" =~ .*"bash".* ]]; then
		source $HOME/.bashrc
	else
		echo "Current shell not supported"
		return 0
	fi
}

# CLI tools overrides
alias cat="bat"
alias vim="nvim"

# fzf helpers
fzf_exclude_patterns() {
    local exclude_patterns=""

    if [[ -f .gitmodules ]]; then
        for path in $(grep path .gitmodules | sed 's/path\s*=\s*//'); do
            exclude_patterns+="--exclude $path "
        done
    fi

    echo $exclude_patterns
}

filesearch() {
    if [[ $# -eq 0 ]]
        then fd --type f --hidden $(fzf_exclude_patterns) | fzf
        else fd --type f --hidden $(fzf_exclude_patterns) | fzf --query ${argv[-1]}
    fi
}

dirsearch() {
    if [[ $# -eq 0 ]]
        then fd --type d --hidden $(fzf_exclude_patterns) | fzf
        else fd --type d --hidden $(fzf_exclude_patterns) | fzf --query ${argv[-1]}
    fi
}

search() {
    if [[ $# -eq 0 ]]
        then fd --hidden $(fzf_exclude_patterns) | fzf
        else fd --hidden $(fzf_exclude_patterns) | fzf --query ${argv[-1]}
    fi
}

# IP address
alias ip="dig +short myip.opendns.com @resolver4.opendns.com"

# Update
updates() {
	# Homebrew
	if command -v brew &> /dev/null; then
		brew update
		brew upgrade
	fi

	# Oh-my-zsh
	if [[ $(ps -p $$) =~ .*"zsh".* ]] && [ -d $HOME/.config/oh-my-zsh ]; then
		omz update
	fi

	# TLDR
	if command -v tldr &> /dev/null; then
		tldr --update
	fi

	# Apt-get updates
	if command -v apt-get &> /dev/null; then
		sudo apt-get update
		sudo apt-get upgrade
	fi
}

# Mac specific aliases
if [[ "$(uname)" == "Darwin" ]]; then
	# Browser
	alias arc="open -a Arc"

	# DNS
	alias clear-dns="sudo killall -HUP mDNSResponder"

	# Hugo
	alias hs='hugo server --bind $(ipconfig getifaddr en0) --baseURL "http://`ipconfig getifaddr en0`"'
fi
