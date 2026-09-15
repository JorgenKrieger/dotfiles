# Claude Instructions for Dotfiles Repository

## What this repo is

A personal macOS dotfiles repo. It manages shell configuration, app configs, window
management, and a set of install/update scripts. Everything is symlinked into place —
edits happen here, not in `~/.config` or `~`.

## Symlink map

Symlinks are created by `lib/partials/symlinks` (plus `~/.config/git/.gitignore_global`
by `lib/partials/git`). Most are **per-file**, not whole directories — edit the source
listed here:

| Source                        | Target                              | Kind |
|-------------------------------|-------------------------------------|------|
| `zsh/.zshenv` `.zprofile` `.zshrc` `.zlogin` | `~/.zshenv` etc. (in `$HOME`) | files |
| `zsh/_init.sh`                | `~/.config/zsh/_init.sh`             | file |
| `zsh/config.d/*`              | `~/.config/zsh/config.d/*`           | files |
| `zsh/autoloaded/`             | `~/.config/zsh/autoloaded`           | dir |
| `zsh/starship.toml`           | `~/.config/starship.toml`            | file |
| `ghostty/config`             | `~/.config/ghostty/config`           | file |
| `ghostty/themes/`            | `~/.config/ghostty/themes`           | dir |
| `bat/config`                 | `~/.config/bat/config`               | file |
| `hammerspoon/`               | `~/.config/hammerspoon`              | dir |
| `vim/.vimrc`                  | `~/.vimrc`                            | file |
| `hblock/{header,allow.list,deny.list}` | `~/.config/hblock/*`       | files |
| `ssh/config`                 | `~/.ssh/config`                      | file |
| `git/.gitignore_global`      | `~/.config/git/.gitignore_global`    | file |
| `dotfiles`                   | `~/bin/dotfiles`                     | file |

Run `dotfiles install` → Symlinks after adding a new config file.

## Project structure

- `dotfiles` — CLI entry point. Dispatches to `lib/` and defines shared helpers:
  `log_success` / `log_warning` / `log_error` / `die` / `run`. Sets `set -euo pipefail`.
- `lib/{install,update,doctor,help}` — one script per CLI command, **sourced** by `dotfiles`.
- `lib/partials/` — sub-steps **sourced** by `lib/` scripts (`symlinks`, `git`, `dns`,
  `login-shell`, `macOS-defaults`). Because they're sourced, they inherit the caller's
  shell options and helper functions, and must use `return` (never `exit`). The hosts
  blocklist has no partial — `install`/`update` call `sudo hblock` directly.
- `zsh/config.d/` — modular ZSH config, sourced in order by `.zshrc`.
- `zsh/autoloaded/` — ZSH functions loaded on demand.
- `.githooks/pre-commit` — `gitleaks protect --staged --redact`; `core.hooksPath` is
  pointed here by `lib/partials/git`. Committing requires `gitleaks` installed.

## Technologies

- **ZSH** — primary shell. Config splits across `.zshenv` (all shells), `.zprofile`
  (login, PATH + locale + nodenv lazy-load), `.zshrc` (interactive, sources `config.d/`,
  runs `compinit`, starts starship), `.zlogin` (post-login, recompiles bytecode in a
  background subshell). Put env vars in `.zshenv`, PATH changes in `.zprofile`,
  everything else in `config.d/`.
  - `.zshrc` sources `config.d/*.sh` in glob order **except `plugins.sh`, which is
    sourced last, after `compinit`** (zsh-syntax-highlighting requires this). Don't
    move it back into the loop.
  - `nodenv` is lazy-loaded in `.zprofile`; its shims are added to PATH in `path.sh`
    so `node`/`npm` work before the first `nodenv` call.
  - The Herd (Laravel) blocks at the bottom of `.zshrc` are injected and managed by
    Herd itself. Leave them alone — the machine-specific paths there are expected.
- **Homebrew** — package manager. Do not edit `Brewfile` directly; a `brew()` wrapper
  in `zsh/config.d/aliases.sh` rewrites and re-sorts it on every `brew install` /
  `brew uninstall` (pass `--no-bundle` to skip).
- **Login shell** — must be Homebrew's zsh (`/opt/homebrew/bin/zsh`), set by
  `lib/partials/login-shell`. If it stays `/bin/zsh`, `.zlogin`'s bytecode cache
  thrashes between two zsh versions.
- **hblock** — generates `/etc/hosts` from `hblock/{header,allow.list,deny.list}`.
  Never hand-edit `/etc/hosts`; custom host entries go in `hblock/header`. Refreshed
  by `dotfiles update`.
- **gum** — use for interactive CLI elements (menus, confirmations, styled output) in
  `lib/` scripts. For pass/warn/fail messages, prefer the `log_*` helpers.
- **Hammerspoon** — macOS window management, config in `hammerspoon/`:
  - `init.lua` — entry point; `require`s `window_management`.
  - `keys.lua` — returns a `Keys` table (bindings only).
  - `window_management.lua` — logic + `hs.hotkey.bind` calls.
  - Hammerspoon reads `~/.config/hammerspoon` (non-default), set via
    `defaults write org.hammerspoon.Hammerspoon MJConfigFile` in `lib/partials/macOS-defaults`.

## Conventions

### XDG directories

Config in `$XDG_CONFIG_HOME` (`~/.config`), data in `$XDG_DATA_HOME` (`~/.local/share`).
New tools should follow this.

### Shell scripts

- Indentation: 4 spaces. Function names: snake_case. ZSH-compatible, no bash-isms.
- **Standalone scripts** (run directly): shebang `#!/usr/bin/env zsh`, and set
  `set -euo pipefail`.
- **Sourced partials** (`lib/`, `lib/partials/`): no need to re-set options — they
  inherit `set -euo pipefail` from `dotfiles`. Use `return`, not `exit`.
- `set -e` footguns to avoid (they aborted `lib/doctor` before):
  - `(( x++ ))` as a statement returns non-zero when the result is 0 → use `x=$((x + 1))`.
  - `var=$(cmd)` aborts the script if `cmd` fails → append `|| true` when a failure is
    an expected, handled case.
- Use `gum` / the `log_*` helpers for user-facing output, not raw `echo`.

### Lua (Hammerspoon)

- Indentation: 4 spaces.
- Keep bindings in `keys.lua`, logic in `window_management.lua`.

### General

- No hardcoded paths **for repo files** — use `$DOTFILES`, `$XDG_CONFIG_HOME`, or
  relative paths. `/opt/homebrew/...` is unavoidable for Apple Silicon Homebrew;
  prefer `$(brew --prefix)` in scripts where practical.
- No root-required commands without explicit user confirmation.
- No comments unless the reason behind the code is non-obvious.

## Validating changes

- Shell: `zsh -n <file>` for a syntax check.
- Lua: `luajit -bl <file> /dev/null` — `luac` isn't installed.
- After any install/symlink change: `dotfiles doctor` (exits non-zero on failure).
