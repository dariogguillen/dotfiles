# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for a Linux desktop environment setup. The repository includes configurations for terminal, editor, window managers, and development tools.

## Key Configuration Components

### LazyVim (Neovim Configuration)
- Location: `lazyvim/`
- Main config: `lazyvim/lua/config/lazy.lua`
- Language support includes: Scala, Java, Python, Rust, TypeScript, Docker, Terraform, and more
- Custom plugins in `lazyvim/lua/plugins/`
- Key features: Metals for Scala development, DAP debugging, LSP configurations

### Shell Environment
- Zsh configuration: `zshrc`
- Uses Oh My Zsh with spaceship theme
- Key aliases: `n` (nvim), `g` (gemini), `c` (claude), `ls`/`ll` (eza with icons)
- Includes FZF, kubectl, and development tool integrations

### Terminal Multiplexer
- Tmux configuration: `tmux.conf`
- Custom prefix: Ctrl+a (instead of Ctrl+b)
- Vim-like key bindings and tmux-nvim integration
- Plugin manager (TPM) with sensible defaults

### Window Managers
- Hyprland configuration: `hyprland.conf` (Wayland compositor)
- i3 configuration: `i3/config` (X11 window manager)
- Multi-monitor setup support

## Development Environment Setup

### Installation Script
- Run `./init.sh` to set up the environment
- Installs development tools via yay package manager (Arch Linux)
- Sets up symlinks for configuration files
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

### Package Management (Arch Linux)
- `update` - Update system packages with yay
- Standard pacman/yay commands for package installation

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
- Configurations work across different window managers (Hyprland/i3)
- Terminal emulator flexibility (Alacritty, WezTerm supported)
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