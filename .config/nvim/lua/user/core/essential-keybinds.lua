-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
local opts = { noremap = true, silent = true }
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "