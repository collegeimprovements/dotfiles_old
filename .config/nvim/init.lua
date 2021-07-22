require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself
    -- libs
    "tjdevries/nlua.nvim", "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "rktjmp/lush.nvim", "tjdevries/colorbuddy.vim", -- tools
    "ahmedkhalf/lsp-rooter.nvim", "b3nj5m1n/kommentary", "blackCauldron7/surround.nvim", "kassio/neoterm", "tpope/vim-repeat",
    "tpope/vim-projectionist", "windwp/nvim-autopairs", "pechorin/any-jump.vim", "phaazon/hop.nvim", -- languages
    "elixir-editors/vim-elixir", -- appearance
    "kyazdani42/nvim-tree.lua", "kyazdani42/nvim-web-devicons", "lifepillar/vim-gruvbox8", "sonph/onehalf", "chriskempson/base16-vim", "rakr/vim-one",
    "sainnhe/edge", "junegunn/seoul256.vim", "tjdevries/gruvbuddy.nvim", "lukas-reineke/indent-blankline.nvim", "onsails/lspkind-nvim",
    "folke/trouble.nvim", "folke/lsp-colors.nvim", "ojroques/nvim-hardline", "lewis6991/gitsigns.nvim", -- lsp
    "hrsh7th/nvim-compe", "hrsh7th/vim-vsnip", "hrsh7th/vim-vsnip-integ", "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            vim.cmd 'TSUpdate'
        end
    }, "nvim-treesitter/nvim-treesitter-textobjects", "ray-x/lsp_signature.nvim", "vim-test/vim-test"

}

local opt = vim.opt
local g = vim.g

-- Options

opt.autoread = true
opt.exrc = true
opt.backup = false
opt.writebackup = false

opt.background = "dark"
opt.backspace = {"indent", "eol", "start"}
opt.backupdir = vim.fn.expand("~/.tmp/backup")
opt.swapfile = false
opt.clipboard = "unnamedplus"
opt.completeopt = "menuone,noselect"
opt.cursorline = false
opt.directory = vim.fn.expand("~/.tmp/swp")
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.errorbells = false
opt.expandtab = true
opt.foldenable = false
opt.foldlevelstart = 99
opt.foldmethod = "syntax"
-- opt.formatoptions = "l"
opt.hidden = true -- Enable background buffers
opt.hlsearch = true -- Highlight found searches
opt.ignorecase = true -- Ignore case
-- opt.inccommand = "nosplit"
opt.inccommand = "split" -- Get a preview of replacements
opt.incsearch = true -- Shows the match while typing
opt.joinspaces = false -- No double spaces with join
opt.lazyredraw = true
opt.linebreak = true -- Stop words being broken on wrap
opt.list = false -- Show some invisible characters
opt.mouse = "a" -- Mouse support
opt.number = true -- Show line numbers
opt.numberwidth = 5 -- Make the gutter wider by default
opt.scrolloff = 8 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.showmode = false -- Don't display mode
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "no" -- always show signcolumns
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = "en"
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
opt.undodir = vim.fn.expand("~/.tmp")
opt.undofile = true
opt.undolevels = 100
opt.updatetime = 250 -- don't give |ins-completion-menu| messages.
opt.visualbell = true
opt.wrap = true
opt.timeoutlen = 1000
opt.shortmess:append("sI") -- disable nvim intro
opt.title = true

opt.synmaxcol = 1000
opt.inccommand = "nosplit"

-- Ignore compiled files
opt.wildignore = "*.zip"
opt.wildignore = opt.wildignore + {
    "*.beam", "*~", "*DS_Store*", "log/**", "*.png", "*.jpg", "*.gif", "*.png", "*.o", "*.obj", "*.so", "*.swp", "*.zip", "*/.Trash/**", "*.pdf",
    "*.dmg", "*/Library/**", "*/_build/**"
}

opt.wildmode = {"longest", "list", "full"}

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17

opt.wildmode = opt.wildmode - "list"
opt.wildmode = opt.wildmode + {"longest", "full"}

vim.cmd("let &fcs='eob: '") -- disable tilde on end of buffer: https://github.com/  neovim/neovim/pull/8546#issuecomment-643643758

-- " Move line(s) up and down
--[[ nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv ]]

vim.cmd("au FocusGained * checktime")

vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Bd bd")
vim.cmd("cnoreabbrev wrap set wrap")
vim.cmd("cnoreabbrev nowrap set nowrap")

vim.cmd("noswapfile")

-- disable builtin vim plugins
opt.wildignore = opt.wildignore + {"*.o", "*~", "*.pyc", "*pycache*"}
g.loaded_gzip = 0
g.loaded_tar = 0
g.loaded_tarPlugin = 0
g.loaded_zipPlugin = 0
g.loaded_2html_plugin = 0
g.loaded_netrw = 0
g.loaded_netrwPlugin = 0
-- g.loaded_matchit = 0
-- g.loaded_matchparen = 0
g.loaded_spec = 0

-- colorscheme
vim.cmd [[color seoul256]]
vim.g.one_allow_italics = true
vim.g.seoul256_background = 236

-- require('colorbuddy').colorscheme('gruvbuddy')

-- mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight on yank
-- cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
-- vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank()" -- this is same as long version below.
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

-- kommentary
require("kommentary.config").configure_language("lua", {prefer_single_line_comments = true})

-- surround
require"surround".setup {}
-- vim.g.surround_prefix = "m"

-- NVimTree
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_update_cwd = 1

-- Hardline
require("hardline").setup {
    bufferline = false, -- enable bufferline
    theme = "nord", -- change theme
    sections = {
        -- define sections
        {class = "mode", item = require("hardline.parts.mode").get_item}, {class = "high", item = require("hardline.parts.git").get_item, hide = 80},
        "%<", {class = "med", item = require("hardline.parts.filename").get_item}, {class = "med", item = "%="},
        {class = "low", item = require("hardline.parts.wordcount").get_item, hide = 80},
        {class = "error", item = require("hardline.parts.lsp").get_error}, {class = "warning", item = require("hardline.parts.lsp").get_warning},
        {class = "warning", item = require("hardline.parts.whitespace").get_item},
        {class = "high", item = require("hardline.parts.filetype").get_item, hide = 80},
        {class = "mode", item = require("hardline.parts.line").get_item}
    },
    bufferline_settings = {
        exclude_terminal = false, -- don't show terminal buffers in bufferline
        show_index = false -- show buffer indexes (not the actual buffer numbers) in bufferline
    }
}

-- indent line
-- vim.g.indentLine_faster = 1
-- vim.g.indentLine_setConceal = 2
-- vim.g.indentLine_concealcursor = ""
-- vim.g.indentLine_bufNameExclude = {"term:.*"}
vim.g.indentLine_char = "│"
vim.g.indent_blankline_char = '│'

-- Compe
require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = {
        border = {'', '', '', ' ', '', '', '', ' '}, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1
    },

    source = {path = true, buffer = true, calc = true, nvim_lsp = true, nvim_lua = true, vsnip = true}
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn['vsnip#available'](1) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        -- If <S-Tab> is not working in your terminal, change it to <C-h>
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.s_tab_complete()", {expr = true})

-- hop
vim.api.nvim_set_keymap("n", "f", "<cmd>lua require'hop'.hint_char1()<cr>", {})

-- nvim-autopairs
require("nvim-autopairs").setup()
require("nvim-autopairs.completion.compe").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true -- it will auto insert `(` after select function or method item
})

-- lsp-rooter
require("lsp-rooter").setup {}

-- gitsigns
require("gitsigns").setup()

-- LSP Kind
require("lspkind").init()

-- Trouble
require("trouble").setup {}
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})

-- treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {"c", "rust"}, -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false
    }
}

-- key-bindings
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)
map("n", "<leader>r", [[ <Cmd> source ~/.config/nvim/init.lua<CR>]], opt)
map("n", "ß", [[<Cmd>:w <CR>]], opt)
map("i", "ß", [[<Cmd>:w <CR>]], opt)
map("n", "<leader>hl", [[<Cmd>set invhlsearch<CR>]], opt)
map("n", "<leader>d", [[ <Cmd> bd<CR>]])
map("i", "<leader>u", [[ <Cmd> undo<CR>]])
map("n", "<leader>e", [[ <Cmd> NvimTreeToggle<CR>]])
map("n", "<leader>ps", [[ <Cmd> PaqSync<CR>]])
map("n", "∫", [[ <Cmd> NvimTreeToggle<CR>]])
map("n", "<C-e>", [[ <Cmd> NvimTreeToggle<CR>]])
map("n", "ƒ", [[<Cmd> Telescope find_files theme=get_dropdown<CR>]])
map("n", "∆", [[<Cmd> TBD<CR>]])
-- map("n", "<leader>f", [[<Cmd> Telescope live_grep<CR>]])
map("n", "<C-p>", [[<Cmd> Telescope git_files<CR>]], opt)
map("n", "π", [[<Cmd> Telescope commands<CR>]], opt)
map("n", "<S-s>", [[<Cmd> <Nop><CR>]], opt)

-- Allow easy navigation between wrapped lines.
map("v", "j", "gj", opt)
map("v", "k", "gk", opt)
map("n", "j", "gj", opt)
map("n", "k", "gk", opt)

-- Paste the last thing yanked
map("n", ",p", '"0p', opt)
map("n", ",P", '"0P', opt)

map("n", "<left>", [[<Cmd>:bprevious<CR>]], opt)
map("n", "<right>", [[<Cmd>:bnext<CR>]], opt)
map("n", "<up>", [[<Cmd>:tabnext<CR>]], opt)
map("n", "<down>", [[<Cmd>:tabprev<CR>]], opt)

-- map("n", "<M-up>", [[<Cmd> :m .-2<CR>==]], opt)
-- map("n", "<M-down>", [[<Cmd> :m .+1<CR>==]], opt)

-- map("i", "<M-up>", [[<Cmd> :m .-2<CR>]], opt)
-- map("i", "<M-down>", [[<Cmd> :m .+1<CR>]], opt)

-- map("v", "<M-up>", [[<Cmd> :m '>+1<CR>gv=gv]], opt)
-- map("v", "<M-down>", [[<Cmd> :m '<-2<CR>gv=gv]], opt)

-----------------------------------------------------------------------------------------------
---  LSP
-----------------------------------------------------------------------------------------------
local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local custom_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 300)<CR>", opts)

    -- vim.api.nvim_command("au BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    -- vim.api.nvim_command("au BufWritePost <buffer> lua vim.lsp.buf.formatting_sync(nil, 100)")
    -- vim.api.nvim_command("autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)")
end

USER = vim.fn.expand("$USER")
local sumneko_binary = "/Users/" .. USER .. "/language-servers/lua-language-server/bin/macOS/lua-language-server"
local sumneko_root_path = "/Users/" .. USER .. "/language-servers/lua-language-server"
nvim_lsp.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = custom_attach,
    flags = {debounce_text_changes = 150},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}
            }
        }
    }
}

nvim_lsp.efm.setup {filetypes = {"lua", "elixir"}}

vim.api.nvim_command("autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_seq_sync(nil, 200)")
vim.api.nvim_command("autocmd BufWritePre *.ex,*.exs lua vim.lsp.buf.formatting_seq_sync(nil, 200)")

local path_to_elixirls = vim.fn.expand("/Users/" .. USER .. "/language-servers/elixir-ls/rel/language_server.sh")
nvim_lsp.elixirls.setup({
    cmd = {path_to_elixirls},
    on_attach = custom_attach,
    flags = {debounce_text_changes = 150},
    settings = {
        elixirLS = {
            -- I choose to disable dialyzer for personal reasons, but
            -- I would suggest you also disable it unless you are well
            -- aquainted with dialzyer and know how to use it.
            dialyzerEnabled = false,
            -- I also choose to turn off the auto dep fetching feature.
            -- It often get's into a weird state that requires deleting
            -- the .elixir_ls directory and restarting your editor.
            fetchDeps = false
        }
    }
})

-- Elixir Pipes
vim.api.nvim_exec([[
augroup elixirbindings
  autocmd! elixirbindings
  autocmd Filetype elixir imap <buffer> <silent> <C-l> \|>
  autocmd Filetype elixir imap <buffer> <silent> <C-h> \|> IO.inspect(label: "Here")
  " autocmd Filetype elixir imap <buffer> <silent> <C-m> %{}
augroup end
]], false)

