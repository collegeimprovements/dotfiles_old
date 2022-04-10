local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- key-bindings - function to map keys and commands
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Visual --
-- Stay in indent mode
-- Keep the selection after indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- Copy Paste Better
keymap("v", "p", '"_dp', opts)
