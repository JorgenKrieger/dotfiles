# Zsh specific plugins
if [[ $(ps -p $$) =~ .*"zsh".* ]]; then
    plugins=(zsh-syntax-highlighting)
	# OS specific plugin locations
	if [[ "$(uname)" == "Darwin" ]]; then 
		source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	else
		source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	fi
fi

