![Dotfiles](/.github/header.png)

<p align="center"><b>Personal dotfiles for macOS, configured for my daily workflow.<br/>Feel free to use them as inspiration for your own setup.</b></p>

> [!NOTE]
> These dotfiles are tailored for my personal use. They may need adjustments to work for your environment.

## 📚 Essential knowledge

> [!WARNING]
> Dotfiles should only contain **shareable** configuration. System- or security-sensitive settings (e.g., private SSH
> keys, tokens) are **not** included here. All files are meant to be symlinked into the system.

### General structure

```sh
zsh/               # Shell config
  ├─ config.d/     # Aliases, options, paths, plugins
  └─ autoloaded/   # Utility functions
lib/               # CLI helpers and partial system installers
hammerspoon/       # Window management and OS automation
Brewfile           # Tracked Homebrew packages
dotfiles           # Interactive CLI for install/update

```

## 🚀 Install

Before being able to clone the repo, we first need to setup git.

```sh
xcode-select --install
```

Next, clone this repository. Personal preference is to clone this into a directory representing the github user name.

```sh
mkdir -p $HOME/JorgenKrieger
git clone https://github.com/JorgenKrieger/dotfiles.git $HOME/JorgenKrieger/dotfiles
cd $HOME/JorgenKrieger/dotfiles
./dotfiles
```

After cloning the repo, run the install scripts.

## What's included?

| Category          | Apps                                                                                                                                                                                                                                                                                                                                                                               |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 💻 CLI            | [`zsh`](https://www.zsh.org), [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting), [`git`](https://git-scm.com), [`nodenv`](https://github.com/nodenv/nodenv), [`homebrew`](https://brew.sh)                                                                                                                                                         |
| 🎨 Design         | [`figma`](https://www.figma.com), [`touchdesigner`](https://www.derivative.ca)                                                                                                                                                                                                                                                                                                     |
| 🛠️ Developments  | [`dbngin`](https://dbngin.com/), [`ghostty`](https://ghostty.org/), [`herd`](https://herd.laravel.com/), [`orbstack`](https://orbstack.dev/), [`webstorm`](https://www.jetbrains.com/webstorm/), [`postman`](https://www.postman.com/), [`trae`](https://www.trae.ai/)                                                                                                             |
| 🎙️ Communication | [`discord`](https://discord.com), [`whatsapp`](https://www.whatsapp.com/)                                                                                                                                                                                                                                                                                                          |
| ✨ Productivity    | [`1password`](https://1password.com), [`arc`](https://arc.net), [`hammerspoon`](https://www.hammerspoon.org), [`hazel`](https://www.hazelapp.com), [`mos`](https://mos.crowerapps.com), [`notion`](https://www.notion.so), [`notion mail`](https://www.notion.com/product/mail), [`notion calendar`](https://www.notion.com/product/calendar), [`raycast`](https://www.raycast.so) |
