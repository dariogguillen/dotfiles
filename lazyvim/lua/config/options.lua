-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.mouse = ""

local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")
opt.undofile = true
opt.undodir = { prefix .. "/nvim/.undo//" }
