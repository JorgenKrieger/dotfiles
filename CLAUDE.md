# Claude Instructions for Dotfiles Repository

## What this repo is

A personal macOS dotfiles repo. It manages shell configuration, app configs, window management, and a set of install/update scripts. Everything is symlinked into place — edits happen here, not in `~/.config` or `~`.

## Symlink map

These are the canonical locations. When editing configs, edit the source here:

| Repo path         | Symlinked to              |
|-------------------|---------------------------|
| `zsh/`            | `~/.config/zsh`           |
| `hammerspoon/`    | `~/.config/hammerspoon`   |
| `ghostty/`        | `~/.config/ghostty`       |
| `bat/`            | `~/.config/bat`           |
| `ssh/`            | `~/.ssh`                  |

## Project structure

- `dotfiles` — main CLI entry point (install, update, doctor, help)
- `lib/` — scripts called by the main executable
- `lib/partials/` — subscripts sourced by `lib/` scripts (symlinks, git config, DNS, etc.)
- `zsh/config.d/` — modular ZSH config files, sourced in order by `.zshrc`
- `zsh/autoloaded/` — ZSH functions loaded on demand

## Technologies

- **ZSH** — primary shell. Config splits across `.zshenv` (all shells), `.zprofile` (login, paths), `.zshrc` (interactive, sources `config.d/`), `.zlogin` (post-login, compiles bytecode). Put env vars in `.zshenv`, PATH changes in `.zprofile`, everything else in `config.d/`.
- **Homebrew** — package manager. Do not edit `Brewfile` directly. A custom `brew()` wrapper in `aliases.sh` auto-updates it on every `brew install` / `brew uninstall`.
- **gum** — use for any interactive CLI elements (menus, confirmations, styled output) in `lib/` scripts.
- **Hammerspoon** — macOS window management. Config lives in `hammerspoon/`. Keybindings are defined in `keys.lua` / `keys_new.lua` separately from logic. During active rewrites, `_new` suffixed files coexist with the originals until they're ready to replace them.

## Conventions

### XDG directories

The repo follows XDG Base Directory standard. Config goes in `$XDG_CONFIG_HOME` (`~/.config`), data in `$XDG_DATA_HOME` (`~/.local/share`). New tools should follow this.

### Shell scripts

- Shebang: `#!/usr/bin/env zsh`
- Always include `set -euo pipefail`
- Indentation: 4 spaces
- Function names: snake_case
- Use `gum` for user-facing output, not raw `echo`

### Lua (Hammerspoon)

- Indentation: 4 spaces
- Keep keybindings in `keys*.lua`, logic in `window_management*.lua`
- During transitions, use the `_new` suffix until the new file is stable, then replace

### General

- No hardcoded paths — use `$DOTFILES`, `$XDG_CONFIG_HOME`, or relative paths
- No root-required commands without explicit user confirmation
- Avoid bash-specific syntax; keep everything ZSH-compatible
- No comments unless the reason behind the code is non-obvious
