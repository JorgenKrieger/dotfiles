# Remove the very annoying linux background colors
if [[ ! "$(uname)" == "Darwin" ]]; then 
	eval "$(dircolors -p | \
		sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
		dircolors /dev/stdin)"
fi