# Project Rules for Dotfiles Repository

## Code Style

### Shell Scripts
- **Indentation**: 4 spaces (no tabs)
- **Line Endings**: LF (Unix-style)
- **Encoding**: UTF-8
- **Script Header**: All shell scripts should start with appropriate shebang (`#!/usr/bin/env zsh`)
- **Error Handling**: Include `set -euo pipefail` for fail-fast behavior
- **Comments**: Use `#` for comments, with section separators using `#-----` or `# ────`
- **Function Names**: Use lowercase with underscores (snake_case)

### Lua Scripts (Hammerspoon)
- **Indentation**: 4 spaces
- **Line Endings**: LF (Unix-style)

## Project Structure

### Directory Organization
- Root directory contains main executable (`dotfiles`)
- Configuration files organized by application/tool in their own directories
- Shell scripts and commands stored in `lib/` directory
- ZSH-specific configurations in `zsh/` directory with appropriate dotfiles

### File Naming
- Configuration files should match their standard names (e.g., `.zshrc`, `.gitignore_global`)
- Script files should be named according to their function (e.g., `update`, `install`)
- Partial scripts should be organized in a `partials/` subdirectory

## Technologies & Frameworks

### Primary
- **Shell**: ZSH as the primary shell
- **UI Enhancement**: `gum` for styled CLI interfaces
- **Package Management**: Homebrew (with Brewfile for dependencies)
- **Window Management**: Hammerspoon for macOS window control

### Configuration Management
- Symlinks should be used to link dotfiles to their appropriate locations
- Configuration should be modular and sourced from separate files where appropriate

## API & Tool Restrictions

### Preferred Tools
- Use `gum` for interactive CLI elements
- Use Homebrew for package management
- Use standard shell utilities when possible

### Restricted Practices
- Avoid bash-specific features that aren't compatible with ZSH
- Avoid hardcoded paths; use environment variables or relative paths
- Avoid commands that require root privileges without explicit user confirmation

## Documentation

### Comments
- Include descriptive comments for complex logic
- Add usage information at the top of executable scripts
- Document function purpose with comments

### README
- Keep README.md updated with installation and usage instructions
- Document any dependencies required for the dotfiles to function properly