-- hop
require "hop".setup()
vim.api.nvim_command("highlight HopNextKey guifg=none guibg=none gui=none ctermfg=none cterm=bold")
vim.api.nvim_command("highlight HopNextKey1 guifg=none guibg=none gui=none ctermfg=none cterm=bold")
vim.api.nvim_command("highlight HopNextKey2 guifg=none guibg=none gui=none ctermfg=none")
vim.api.nvim_command("highlight HopUnmatched guifg=none guibg=none guisp=none ctermfg=none")

vim.api.nvim_set_keymap("n", "f", "<cmd>lua require'hop'.hint_char1()<cr>", {})

--  vim.api.nvim_command('highlight HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')
