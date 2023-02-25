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

local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

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

-- Key Mappings
map("n", "<leader>s", [[ <Cmd> set signcolumn=number<CR>]], opts) -- Toggle Number
map("n", "<leader>S", [[ <Cmd> set signcolumn=yes:1<CR>]], opts) -- Toggle Number
-- map("n", "<leader>l", [[ <Cmd> lua <CR>]], opts) -- Toggle Number
-- map("n", "<leader>L", [[ <Cmd> set signcolumn=yes:1<CR>]], opts) -- Toggle Number
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opts) -- Toggle Number
map("n", "<leader>r", [[ <Cmd> source ~/.config/nvim/init.lua<CR>]], opts) -- Source $MYVIMRC
-- map("n", "ß", [[<Cmd>:w <CR>]], opts) -- Save - Cmd+s
map("n", "ß", [[<Cmd> lua vim.lsp.buf.format()<CR><Cmd>:w<CR>]], opts) -- symbols-outline
map("i", "ß", [[<Cmd>:w <CR>]], opts) -- Save - Cmd+s
map("n", "∑", [[<Cmd>:q <CR>]], opts) -- Quit - Cmd+w
map("n", "<c-q>", [[<Cmd>:q! <CR>]], opts) -- Quit
map("n", "bn", [[<Cmd>:q <CR>]], opts) -- Quit - `bn` in Normal mode
map("n", "<leader>hl", [[<Cmd>set invhlsearch<CR>]], opts) -- Toggle Search Highlight
map("n", "<leader>d", [[ <Cmd> bd<CR>]]) -- Close the buffer
map("n", "bd", [[<Cmd> bd <CR>]], opts) -- Close the buffer
map("n", "<leader>ps", [[ <Cmd> Lazy sync<CR>]]) -- Sync = install + update the plugins
map("n", "∫", [[ <Cmd> NvimTreeToggle<CR>]]) -- Cmd+b Open NvimTree Sidebar
map("n", "<C-e>", [[ <Cmd> NvimTreeToggle<CR>]]) -- Open NvimTree Sidebar
map("n", "<leader>m", [[<Cmd> Rg<CR>]]) -- Find Buffers
map("n", "<leader>b", [[<Cmd> Buffers<CR>]]) -- Find Buffers
map("n", "<leader>hh", [[<Cmd> History<CR>]], opts) -- symbols-outline
map("n", "<leader>h", [[<Cmd> History<CR>]], opts) -- symbols-outline
-- map("n", "<leader>hi", [[<Cmd> History<CR>]], opts) -- symbols-outline
map("n", "∆", [[<Cmd> TBD<CR>]]) -- Cmd+Shift+j unmapped for now
map("n", "π", [[<Cmd> Files<CR>]], opts) -- Cmd+p Dropdown with commands
map("n", "ƒ", [[<Cmd> Files<CR>]]) -- Find Files
map("n", "<C-p>", [[<Cmd> GFiles --exclude-standard --others --cached<CR>]], opts)
map("n", "¬", [[<Cmd> LazyGit<CR>]], opts) -- Cmd+l Lazygit
map("n", ";;", "<C-^>", opts) -- goto pervious file fast
map("n", "<leader>;", ":", opts) -- Run commad in command-mode. i.e. at bottom of nvim's commandline.
map("x", "<leader>;", ":", opts) -- Run commad in command-mode. i.e. at bottom of nvim's commandline.
map("n", "<c-c>", ":", opts) -- Run commad in command-mode. i.e. at bottom of nvim's commandline.
map("x", "<c-c>", ":", opts) -- Run commad in command-mode. i.e. at bottom of nvim's commandline.
map("n", "<leader>tt", [[<Cmd>:SymbolsOutline<CR>]], opts) -- symbols-outline
map("n", "<leader>td", [[<Cmd>:TroubleToggle document_diagnostics<CR>]], opts) -- symbols-outline

-- Telescope
-- map("n", "ƒ", [[<Cmd> Telescope find_files theme=get_dropdown<CR>]]) -- Find Files
-- map("n", "<C-p>", [[<Cmd> Telescope git_files theme=get_dropdown<CR>]], opts)
-- map("n", "<S-s>", [[<Cmd>Telescope builtin<CR>]], opts) -- Telescope builtin things
-- map("n", "π", [[<Cmd> Telescope commands theme=get_dropdown<CR>]], opts) -- Cmd+p Dropdown with commands
-- map("n", "<leader>b", [[<Cmd> Telescope buffers theme=get_dropdown<CR>]]) -- Find Buffers
-- map("n", "<leader>s", [[<Cmd> Telescope live_grep theme=get_dropdown<CR>]]) -- Find Buffers
