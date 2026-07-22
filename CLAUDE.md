# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for an **Omarchy** system (an opinionated, Hyprland-based Arch Linux distribution). It contains configurations for the terminal, editor, window manager, shell, and development tools.

Most desktop configs follow Omarchy's override model: the real files live under `~/.config/` — where they source Omarchy's defaults from `~/.local/share/omarchy/` — and are symlinked back into this repo via `init.sh` so they stay version-controlled. When editing anything under `~/.config/hypr`, `~/.config/waybar`, the terminals, etc., use the **`omarchy` skill**. Never edit files in `~/.local/share/omarchy/` (Omarchy's source; overwritten on update).

## Key Configuration Components

### LazyVim (Neovim Configuration)
- Location: `lazyvim/`
- Main config: `lazyvim/lua/config/lazy.lua`
- Language support includes: Scala, Java, Python, Rust, TypeScript, Docker, Terraform, and more
- Custom plugins in `lazyvim/lua/plugins/`
- Key features: Metals for Scala development, DAP debugging, LSP configurations
- `~/.config/nvim` is symlinked to `lazyvim/`
- Omarchy integration: theme hot-reload driven by the git-ignored `lua/plugins/theme.lua` symlink (→ `~/.config/omarchy/current/theme/neovim.lua`), plus transparency, remote clipboard (OSC 52), and news/scroll-animation tweaks copied from Omarchy's starter

### Shell Environment
- Zsh configuration: `zshrc` (symlinked to `~/.zshrc`); zsh is the default shell
- Uses Oh My Zsh with spaceship theme; plugins/theme are cloned by `init.sh`
- Key aliases: `n` (nvim), `c` (claude), `ls`/`ll`/`lt` (eza with icons), `update` (yay)
- Optional-tool hooks (fzf, kubectl, direnv, ruby gems, bloop) are guarded with `command -v` so a fresh machine loads cleanly; `TERM` is left to the terminal/tmux, not forced

### Terminal Multiplexer
- Tmux configuration: `tmux.conf`
- Custom prefix: Ctrl+a (instead of Ctrl+b)
- Vim-like key bindings and tmux-nvim integration
- Plugin manager (TPM) with sensible defaults

### Window Manager (Hyprland via Omarchy)
- Config: `hypr/` — modular Omarchy override files (`bindings.conf`, `monitors.conf`, `input.conf`, `looknfeel.conf`, `hyprland.conf`, etc.), symlinked to `~/.config/hypr/`
- These files layer on top of Omarchy's defaults (sourced from `~/.local/share/omarchy/default/hypr/`); do not edit the defaults
- Customizations: vim-style window nav (`SUPER+hjkl` focus, `+CTRL` move, `+SHIFT` resize; lock relocated to `SUPER+CTRL+ESC`), docked multi-monitor layout with per-monitor workspace pinning
- After changes: `hyprctl reload` then `hyprctl configerrors`
- `i3/config` remains as a legacy X11 setup, unused under Omarchy/Wayland

## Development Environment Setup

### Installation Script
- Run `./init.sh` to set up the environment (the symlink/clone lines are commented — uncomment what you need per machine)
- Installs tools via `yay`/`pacman`; on Omarchy prefer `omarchy pkg add <pkg>` / `omarchy pkg aur add <pkg>`
- Symlinks configs into `~/.config` (replacing Omarchy's stock `nvim`/`hypr` dirs) and clones the zsh/tmux plugins
- Configures Git, Docker, and language environments

### Language Support
- **Scala**: Coursier, SBT, Bloop build server, Metals LSP
- **Java**: Multiple JDK versions (8, 11, 17, 21)
- **Python**: pip, pynvim for Neovim integration
- **Rust**: rustup, rust-analyzer
- **Node.js**: NVM, global packages for Neovim
- **Ruby**: Gem user directory in PATH
- **Kotlin**: Native support through LazyVim

### Development Tools
- **Debugging**: DAP support for JavaScript/TypeScript, Scala (via Metals)
- **Git**: lazygit, custom Git configuration
- **Docker**: docker, docker-compose, lazydocker
- **Kubernetes**: kubectl, kubectx for context switching
- **File Management**: ranger (terminal file manager), fzf (fuzzy finder)

## Common Commands

### Environment Setup
- `./init.sh` - Initial setup script for dotfiles installation
- `stylua .` - Format Lua files in LazyVim configuration (uses stylua.toml)

### Tmux Session Management
- `tmuxinator new <name>` or `txn <name>` - Create new tmux session
- `tmuxinator start <name>` or `txs <name>` - Start existing session
- Sessions configured in `tmuxinator/` directory
- `tmux-floax` - Float terminal plugin (Ctrl+a + p for floating pane)
- Vim-tmux navigation with Ctrl+hjkl

### Package Management (Omarchy / Arch)
- `update` - Update system packages with yay; or `omarchy update` for a full system update
- `omarchy pkg add <pkgs>` / `omarchy pkg aur add <pkgs>` - install packages
- Standard `pacman`/`yay` commands also work

### File Navigation
- `ls` - List files with icons (eza)
- `ll` - Detailed list with icons
- `lt` - Tree view with icons

### Development Tools
- `n <file>` - Open file in Neovim
- `c` - Launch Claude Code
- FZF fuzzy finder with Ctrl+R for command history
- `kubectl` with completion and `kubectx` for context switching

## Architecture Notes

### Modular Configuration Structure
- Each tool has its dedicated configuration directory or file
- LazyVim uses modular plugin system with separate files per functionality
- Tmux and shell configurations support plugin ecosystems

### Multi-Environment Support
- Primary desktop is Hyprland via Omarchy (Wayland); `i3/` is a legacy X11 setup
- Terminal emulator flexibility (Kitty is the Omarchy default; Alacritty, WezTerm also configured)
- Development environment works with multiple language ecosystems

### Key Integrations
- Vim-tmux navigation integration
- Shell and editor share consistent key bindings and themes
- Development tools integrated through LSP and DAP protocols

### LazyVim Plugin Architecture
- Custom plugins in `lua/plugins/*.lua` with specific configurations:
  - `metals.lua` - Scala development with nvim-metals and DAP integration
  - `dap.lua` - Debug Adapter Protocol for JS/TS debugging (F5-F8 keys)
  - `nvim-tmux.lua` - Seamless vim-tmux navigation
  - `neotree.lua`, `lualine.lua`, `treesitter.lua` - UI and syntax enhancements
- Language extras loaded via LazyVim extras system for comprehensive language support
- Plugin management through lazy.nvim with automatic updates