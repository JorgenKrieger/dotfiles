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

Next, clone this repository. You'll be asked where to clone it into — the repo will always be named `dotfiles`.

```sh
read "PARENT?Clone into (. / ~ / ~/JorgenKrieger): "
PARENT="${PARENT:-$HOME/JorgenKrieger}"
mkdir -p "$PARENT"
git clone https://github.com/JorgenKrieger/dotfiles.git "$PARENT/dotfiles"
cd "$PARENT/dotfiles" && ./dotfiles
```

The `./dotfiles` command will run the installer, from where you can pick what parts you'd like to install.

## What's included?

| Category        | Apps                                                                                                                                                                                                                                                                                                                                                                                                                            |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 💻 CLI          | [`zsh`](https://www.zsh.org), [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting), [`git`](https://git-scm.com), [`nodenv`](https://github.com/nodenv/nodenv), [`homebrew`](https://brew.sh), [`starship`](https://starship.rs), [`fzf`](https://github.com/junegunn/fzf)                                                                                                                         |
| 🎨 Design       | [`figma`](https://www.figma.com), [`affinity`](https://affinity.serif.com), [`imageoptim`](https://imageoptim.com)                                                                                                                                                                                                                                                                                                              |
| 🛠️ Development  | [`ghostty`](https://ghostty.org), [`herd`](https://herd.laravel.com), [`docker-desktop`](https://www.docker.com/products/docker-desktop), [`dbngin`](https://dbngin.com), [`tableplus`](https://tableplus.com), [`postman`](https://www.postman.com)                                                                                                                                                                            |
| 🎙️ Chat         | [`discord`](https://discord.com), [`whatsapp`](https://www.whatsapp.com), [`elgato camera hub`](https://www.elgato.com/en/camera-hub)                                                                                                                                                                                                                                                                                           |
| ⚡ Productivity | [`1password`](https://1password.com), [`arc`](https://arc.net), [`hammerspoon`](https://www.hammerspoon.org), [`raycast`](https://www.raycast.com), [`hazel`](https://www.hazelapp.com), [`mos`](https://mos.crowerapps.com), [`notion`](https://www.notion.so), [`notion mail`](https://www.notion.com/product/mail), [`notion calendar`](https://www.notion.com/product/calendar), [`google drive`](https://drive.google.com) |
| 🔒 Privacy      | [`hblock`](https://github.com/hectorm/hblock)                                                                                                                                                                                                                                                                                                                                                                                   |
| 💡 Hardware     | [`logi options+`](https://www.logitech.com/en-us/software/logi-options-plus.html), [`philips hue sync`](https://www.philips-hue.com/en-us/entertainment/sync-with-pc)                                                                                                                                                                                                                                                           |
