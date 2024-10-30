-- set leader key to space
vim.g.mapleader = " "
-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk or kj  to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- clear search highlights
keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP')

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- buffer management
keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Move to next buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Move to previous buffer" })
keymap.set("n", "<leader>q", "<cmd>bp<cr><cmd>bd #<cr>")

-- resize splits with arrows key
keymap.set("n", "<Left>", "<cmd>vertical resize -1<CR>", { desc = "Resize split vertical -1" })
keymap.set("n", "<Right>", "<cmd>vertical resize +1<CR>", { desc = "Resize split vertical +1" })
keymap.set("n", "<Up>", "<cmd>resize -1<CR>", { desc = "Resize split -1" })
keymap.set("n", "<Down>", "<cmd>resize +1<CR>", { desc = "Resize split +1" })

-- save and save all
keymap.set("n", "<C-s>", "<cmd>w<CR>")
keymap.set("i", "<C-s>", "<cmd>w<CR>")
keymap.set("n", "<C-S>", "<cmd>wa<CR>")
keymap.set("i", "<C-S>", "<cmd>wa<CR>")

-- source config
keymap.set("n", "<leader>so", "<cmd>source %<CR>", { desc = "Reload configuration" })
