-- vim-test
vim.api.nvim_set_keymap("n", "t<C-n>", "<Cmd>TestNearest<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "tn", "<Cmd>TestNearest<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-m>", "<Cmd>TestNearest<CR>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "t<C-f>", "<Cmd>TestFile<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "tf", "<Cmd>TestFile<CR>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "t<C-s>", "<Cmd>TestSuite<CR>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "t<C-l>", "<Cmd>TestLast<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "tl", "<Cmd>TestLast<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<c-x>", "<Cmd>TestLast<CR>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "t<C-v>", "<Cmd>TestVisit<CR>", { silent = true, noremap = true })
