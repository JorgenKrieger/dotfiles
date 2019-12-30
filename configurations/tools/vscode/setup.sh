#!/bin/bash

installer "Setting up Visual Studio Code"

# Link user settings
action "Linking settings"
ln -nfs $PATH_CONFIGURATIONS/tools/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

action "Installing plugins"

PLUGINS=(
    # Languages
    rebornix.Ruby
    syler.sass-indented
    sianglim.slim
    dunstontc.viml
    ms-python.python

    # Linter
    lkytal.coffeelinter
    dbaeumer.vscode-eslint
    glen-84.sass-lint
    aliariff.slim-lint
    thibaudcolas.stylelint

    # Intellisense
    Zignd.html-css-class-completion
    christian-kohler.path-intellisense
    felixfbecker.php-intellisense
    gencer.html-slim-scss-css-class-completion
    mrmlnc.vscode-scss

    # Themes & colors
    monokai.theme-monokai-pro-vscode
    file-icons.file-icons
    pkief.material-icon-theme
    coenraads.bracket-pair-colorizer-2
    aaron-bond.better-comments
    oderwat.indent-rainbow
    kamikillerto.vscode-colorize

    # Code automatisation
    formulahendry.auto-rename-tag
    formulahendry.auto-close-tag
    tabnine.tabnine-vscode

    # Misc
    annsk.alignment
    ms-azuretools.vscode-docker
    vscodevim.vim
)

for extension in "${PLUGINS[@]}"; do
    code --install-extension $extension
done