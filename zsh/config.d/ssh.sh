# Set 1password as SSH agent
# https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent
OP_SSH_AGENT="$HOME/.1password/agent.sock"

if [[ -S "$OP_SSH_AGENT" ]]; then
    export SSH_AUTH_SOCK="$OP_SSH_AGENT"
else
    gum style --foreground 196 --bold "❌ 1Password SSH agent not found."
    gum style --foreground 214 "It looks like 1Password isn't running or SSH agent is disabled."

    if gum confirm "Start 1Password and reload shell config?"; then
        open -a "1Password"
        gum spin --spinner dot --title "Waiting for 1Password SSH agent..." -- sleep 3
        if [[ -S "$OP_SSH_AGENT" ]]; then
            export SSH_AUTH_SOCK="$OP_SSH_AGENT"
            gum style --foreground 46 --bold "✅ SSH agent detected and loaded."
            source "$HOME/.zshrc"
        else
            gum style --foreground 196 --bold "❌ Still no SSH agent. Please check your 1Password settings."
        fi
    fi
fi