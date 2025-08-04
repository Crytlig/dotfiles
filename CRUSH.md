# CRUSH Configuration

## Build/Development Commands
- `nix run ~/dotfiles/#dev.switch` - Switch to development environment
- `nix run ~/dotfiles/#dev.rollback` - Rollback development changes
- `nix build ~/dotfiles/#dev` - Build without switching
- `nix run github:numtide/nix-ai-tools#crush` - Run crush directly from nix-ai-tools
- `git submodule update --recursive --remote` - Update submodules
- `git-crypt unlock` - Unlock encrypted files
- `stow .` - Symlink dotfiles (from dotfiles directory)

## Code Style Guidelines
- **Shell Scripts**: Use `#!/bin/zsh` or `#!/usr/bin/env bash`
- **Aliases**: Keep in `.aliases.zsh`, use descriptive names
- **Functions**: Define in `.aliases.zsh` with proper error handling
- **Nix**: Follow existing flake.nix structure, use `with pkgs;` for package lists
- **Config Files**: Use consistent indentation (2 spaces for YAML/TOML, 4 for shell)
- **Error Handling**: Use `set -eo pipefail` in functions, check command success with `|| error_exit`
- **Variables**: Use lowercase with underscores for local vars, UPPERCASE for exports

## File Organization
- Dotfiles managed with GNU Stow for symlinking
- Config files in `.config/` subdirectory
- Encrypted files use git-crypt
- Oh-My-Zsh plugins in `.oh-my-zsh/custom/plugins/`
- Development tools managed via Nix flake

## Tools & Aliases
- `lg` = lazygit, `nv` = nvim, `k` = kubectl, `tf` = terraform
- Use `rg` (ripgrep) for searching, `fzf` for fuzzy finding
- Starship prompt with git branch display
- Tmux sessions via `tmdef()` function for project management