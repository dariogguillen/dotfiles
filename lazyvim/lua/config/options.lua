-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.mouse = ""

opt.guicursor = {
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
}

opt.swapfile = false
opt.undofile = true
-- Keep undo history out of the config dir (which is symlinked into the dotfiles
-- repo); write it under XDG state instead so it never pollutes version control.
opt.undodir = { vim.fn.stdpath("state") .. "/undo//" }

opt.relativenumber = true

vim.g.lazyvim_prettier_needs_config = true

-- Disable unused language providers (silences their :checkhealth warnings).
-- node/python3 are left enabled since plugins in this setup use them.
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Emit OSC 52 yanks so copies reach the host over tmux/SSH.
require("config.remote_clipboard").setup()
