<h1 align="center">Dotfiles</h1>
<h4 align="center">💻 Automated configuration, preferences and software installer for macOS, linux and WSL.</h4>
<p align="center">This dotfiles setup has been created for personal use across several devices.</p>

<h3 align="center">Tested on:</h3>
<div align="center">
	<img src="https://img.shields.io/badge/-Ventura-F5F5F7.svg?style=for-the-badge&colorA=FAFAFC&logoColor=323232&logo=apple" />
	<img src="https://img.shields.io/badge/-WSL_2-F5F5F7.svg?style=for-the-badge&colorB=393939&colorA=4D4D4D&logoColor=CCCCCC&logo=windowsterminal" />
	<img src="https://img.shields.io/badge/-Ubuntu_22.04-E95420.svg?style=for-the-badge&colorB=C33909&colorA=E95420&logoColor=FFFFFF&logo=ubuntu" />
</div>

## Install

Depending on the system, some of the installation steps might differ.

<details>
<summary><h3>Mac OS</h3></summary>
Before being able to clone the repo, we first need to setup git.

```sh
xcode-select --install
```

Next, clone this repository. Personal preference is to clone this into a directory representing the github user name.

```sh
mkdir -p $HOME/jorgenkrieger
git clone https://github.com/JorgenKrieger/dotfiles.git $HOME/jorgenkrieger/dotfiles
```

After cloning the repo, run the install scripts.

</details>
<details>
	<summary><h3>WSL</h3></summary>

Start off with cloning the repository.

```sh
mkdir -p $HOME/jorgenkrieger
git clone https://github.com/JorgenKrieger/dotfiles.git $HOME/jorgenkrieger/dotfiles
```

</details>
<details>
	<summary><h3>Linux</h3></summary>
</details>

## Essential knowledge

> ** Warning** Although dotfiles contain most preferences, not all preferences are equally sharable (think security settings). That's why the dotfiles repository should only contain shareble data and be symlinked into the system.
