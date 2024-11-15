-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap -- for conciseness

-- set leader key to space
vim.g.mapleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- General Keymaps -------------------

-- use jk or kj  to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
-- Keep last yanked when pasting
keymap.set("v", "p", '"_dP')

-- Vertical scroll and center
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Find and center
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- source config
keymap.set("n", "<leader>so", "<cmd>source %<CR>", { desc = "Reload configuration" })
