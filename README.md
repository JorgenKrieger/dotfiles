![Dotfiles](/.github/header.png)

Personal dotfiles for macOS, configured for my daily workflow.  
Feel free to use them as inspiration for your own setup.

> [!NOTE]  
> These dotfiles are tailored for my personal use. They may need adjustments to work for your environment.

## 📚 Essential knowledge

> [!WARNING]
> Dotfiles should only contain **shareable** configuration.  
> System- or security-sensitive settings (e.g., private SSH keys, tokens) are **not** included here.  
> All files are meant to be symlinked into the system.

## 🚀 Install

Before being able to clone the repo, we first need to setup git.

```sh
xcode-select --install
```

Next, clone this repository. Personal preference is to clone this into a directory representing the github user name.

```sh
mkdir -p $HOME/jorgenkrieger
git clone https://github.com/JorgenKrieger/dotfiles.git $HOME/jorgenkrieger/dotfiles
cd $HOME/jorgenkrieger/dotfiles
git submodule update --init --recursive
./dotfiles
```

After cloning the repo, run the install scripts.

## What's included?

| Category        | Apps                                                                                                                                                                                                                                                                                             |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 💻 CLI          | [`zsh`](https://www.zsh.org), [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting), [`git`](https://git-scm.com), [`nvm`](https://github.com/nvm-sh/nvm), [`homebrew`](https://brew.sh)                                                                             |
| 🎨 Design       | [`figma`](https://www.figma.com), [`touchdesigner`](https://www.derivative.ca)                                                                                                                                                                                                                   |
| 🛠️ Developments | [`dbngin`](https://dbngin.com/), [`ghostty`](https://ghostty.org/), [`herd`](https://herd.laravel.com/), [`orbstack`](https://orbstack.dev/), [`phpstorm`](https://www.jetbrains.com/phpstorm/), [`postman`](https://www.postman.com/), [`trae`](https://www.trae.ai/)                           |
| ✨ Productivity | [`1password`](https://1password.com), [`arc`](https://arc.net), [`discord`](https://discord.com), [`hammerspoon`](https://www.hammerspoon.org), [`hazel`](https://www.hazelapp.com), [`mos`](https://mos.crowerapps.com), [`notion`](https://www.notion.so), [`raycast`](https://www.raycast.so) |
