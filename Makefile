XDG_CONFIG_HOME = $${HOME}/.config
MKDIR = mkdir -p

help:
	@echo "Make commands overview"
	@echo "======================================================================="
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

brew:
	@brew bundle --file=$(CURDIR)/Brewfile

git-submodules:
	@git submodule init
	@git submodule update --recursive

dns: ## Set DNS provider
	@echo "Please select a DNS provider"; \
	echo '1) 1.1.1.1 for Families'; \
	echo '2) Google Public DNS'; \
	echo '0) System default'; \
	read -p 'Enter choice: ' RESULT &&  $(MAKE) RESULT=$$RESULT set-dns

set-dns:
	@case $(RESULT) in \
		1) sudo networksetup -setdnsservers Wi-Fi 1.1.1.3 1.0.0.3 2606:4700:4700::1113 2606:4700:4700::1003;; \
		2) sudo networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4 2001:4860:4860::8888 2001:4860:4860::8844;; \
		0) sudo networksetup -setdnsservers Wi-Fi "Empty";; \
		*) echo "Unvalid option"; exit;; \
	esac

hosts: ## Install Ultimate Hosts Blacklist
	@sudo mv /etc/hosts /etc/hosts.bak
	@sudo curl https://hosts.ubuntu101.co.za/hosts --output /etc/hosts

mac-defaults: ## Setup Mac defaults
	@source macOS-defaults.sh

install: git-submodules dns hosts install-homebrew brew setup-git setup-vim setup-bat setup-hammerspoon setup-ssh setup-zsh folders mac-defaults ## Total dotfiles setup
	@echo "Total install"

folders: ## Create folder structure
	@mkdir $(HOME)/Desktop/Temp
	@mkdir $(HOME)/Desktop/Screenshots
	@defaults write com.apple.screencapture location ~/Desktop/Screenshots

install-homebrew:
	@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

setup-vim: ## Configure vim
	@ln -nfs $(CURDIR)/vim/.vimrc $(HOME)/.vimrc2
	@vim +:PlugInstall

setup-bat: ## Configure bat (cli) settings
	@mkdir -p $(XDG_CONFIG_HOME)/bat
	@ln -nfs $(CURDIR)/bat/config $(XDG_CONFIG_HOME)/bat/config
	@ln -nfs $(CURDIR)/bat/themes $(XDG_CONFIG_HOME)/bat/themes
	@bat cache --build

setup-hammerspoon: ## Configure hammerspoon settings
	@ln -nfs $(CURDIR)/hammerspoon $(XDG_CONFIG_HOME)/hammerspoon
	@defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

setup-git: ## Configure git default settings
	@ln -nfs $(CURDIR)/git/.gitignore_global $(XDG_CONFIG_HOME)/git/.gitignore_global
	@source $(CURDIR)/git/config.sh

setup-zsh: ## Configure ZSH
	@ln -nfs $(CURDIR)/zsh/oh-my-zsh $(XDG_CONFIG_HOME)/zsh/oh-my-zsh
	@ln -nfs $(CURDIR)/zsh/custom $(XDG_CONFIG_HOME)/zsh/custom
	@ln -nfs $(CURDIR)/zsh/starship.toml $(XDG_CONFIG_HOME)/starship.toml
	@ln -nfs $(CURDIR)/zsh/config.d $(XDG_CONFIG_HOME)/zsh/config.d
	@ln -nfs $(CURDIR)/zsh/.zshrc $(HOME)/.zshrc
	@source $(HOME)/.zshrc

setup-ssh: ## Configure SSH to use 1Password
	@ln -nfs $(CURDIR)/ssh/config $(HOME)/.ssh/config