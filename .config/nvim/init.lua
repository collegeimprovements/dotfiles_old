require "paq" {
    "savq/paq-nvim",
    -- Let Paq manage itself

    -- libs
    "tjdevries/nlua.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "rktjmp/lush.nvim",
    "tjdevries/colorbuddy.vim",
    -- tools
    "ahmedkhalf/lsp-rooter.nvim",
    "b3nj5m1n/kommentary",
    "blackCauldron7/surround.nvim",
    "kassio/neoterm",
    "tpope/vim-repeat",
    "tpope/vim-projectionist",
    "windwp/nvim-autopairs",
    "pechorin/any-jump.vim",
    "phaazon/hop.nvim",
    "junegunn/fzf.vim",
    {"junegunn/fzf", run = function()
            vim.fn["fzf#install"]()
        end},
    "ray-x/guihua.lua",
    "ray-x/sad.nvim",
    -- languages
    "elixir-editors/vim-elixir",
    -- appearance
    "kyazdani42/nvim-web-devicons",
    "lifepillar/vim-gruvbox8",
    "sonph/onehalf",
    "chriskempson/base16-vim",
    "rakr/vim-one",
    "sainnhe/edge",
    "junegunn/seoul256.vim",
    "tjdevries/gruvbuddy.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "onsails/lspkind-nvim",
    "tpope/vim-dispatch",
    "folke/trouble.nvim",
    "folke/lsp-colors.nvim",
    "ojroques/nvim-hardline",
    "lewis6991/gitsigns.nvim",
    -- lsp
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "ray-x/lsp_signature.nvim",
    "vim-test/vim-test",
    "sindrets/diffview.nvim",
    "simrat39/symbols-outline.nvim",
    "ruifm/gitlinker.nvim",
    "tanvirtin/vgit.nvim",
    "kdheepak/lazygit.nvim",
    "kyazdani42/nvim-tree.lua",
    "hrsh7th/vim-vsnip",
    "hrsh7th/vim-vsnip-integ",
    "hrsh7th/nvim-compe"
}

-- Removed treesitter as due to some issue it was making vim slow.
-- Revisit in future
-- {
--         'nvim-treesitter/nvim-treesitter',
--         run = function()
--             vim.cmd 'TSUpdate'
--         end
--     },

-- key-bindings - function to map keys and commands
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.cmd("au! BufWritePost $MYVIMRC source %") -- Source $MYVIMRC after saving

local opt = vim.opt
local g = vim.g

-- Options
opt.shortmess:append("sI") -- disable nvim intro

opt.autoread = true
opt.exrc = true
opt.backup = false
opt.writebackup = false
opt.wildmenu = true

opt.background = "dark"
opt.backspace = {"indent", "eol", "start"}
opt.backupdir = vim.fn.expand("~/.tmp/backup")
opt.directory = vim.fn.expand("~/.tmp/swp")
opt.swapfile = false -- Don't keep swap file. Most projects have git.
opt.clipboard = "unnamedplus" -- Use system's clipboard.
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = false
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
opt.lazyredraw = true -- Don't expand macros like we are running the commands manually.
opt.linebreak = true -- Stop words being broken on wrap
opt.list = false -- Show some invisible characters
opt.mouse = "a" -- Mouse support
opt.number = true -- Show line numbers
opt.numberwidth = 1 -- Make the gutter wider by default
opt.scrolloff = 8 -- Lines of context. i.e. when pressing <c-d>, `L`, it will keep 8 lines at bottom.
opt.sidescrolloff = 8 -- Columns of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.showmode = false -- Don't display mode
opt.signcolumn = "number" -- always show signcolumns
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = "en" -- English
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
opt.undodir = vim.fn.expand("~/.tmp")
opt.undofile = true
opt.undolevels = 100
opt.updatetime = 250 -- don't give |ins-completion-menu| messages.
opt.visualbell = true
opt.wrap = true -- there is also abbreviation for it
opt.timeoutlen = 1000
opt.title = true -- Title string is below. file_path_based_on_root_folder[root_folder_path]
-- vim.o.swapfile = false -- No swapfile
opt.swapfile = false -- No swapfile
opt.synmaxcol = 1000 -- After 1000 charcters in a line, turn off syntax highlighting. Keep it fast.
opt.inccommand = "nosplit" --  if we want to show live results in a split window, set it as `split`

-- No swapfile
-- vim.cmd("noswapfile")

-- Ignore compiled files
opt.wildignore = "*.zip"
opt.wildignore =
    opt.wildignore +
    {
        "*.beam",
        "*~",
        "*DS_Store*",
        "log/**",
        "*.png",
        "*.jpg",
        "*.gif",
        "*.png",
        "*.o",
        "*.obj",
        "*.so",
        "*.swp",
        "*.zip",
        "*/.Trash/**",
        "*.pdf",
        "*.dmg",
        "*/Library/**",
        "*/_build/**"
    }

opt.wildmode = {"longest", "list", "full"}

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17

opt.wildmode = opt.wildmode - "list"
opt.wildmode = opt.wildmode + {"longest", "full"}

vim.cmd("let &fcs='eob: '") -- disable tilde on end of buffer: https://github.com/  neovim/neovim/pull/8546#issuecomment-643643758

vim.cmd("au FocusGained * checktime") -- AutoRead on buffer focusgained

-- Command Mode Abbreviations
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Bd bd")
vim.cmd("cnoreabbrev wrap set wrap")
vim.cmd("cnoreabbrev nowrap set nowrap")

-- vim-test
vim.cmd('let test#strategy = "neoterm"')

-- FZF
vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'


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

-- colorscheme : seoul256-236-as-background
vim.cmd [[color seoul256]]
vim.g.one_allow_italics = true
vim.g.seoul256_background = 236

-- require('colorbuddy').colorscheme('gruvbuddy')

-- mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- " Keep the selection after indenting
vim.api.nvim_set_keymap("x", "<", "<gv", {noremap = true})
vim.api.nvim_set_keymap("x", ">", ">gv", {noremap = true})

-- " Faster keyword completion - for <ctrl-j,k>, <ctrl-n,p>
-- " disable scanning included files
vim.cmd("set complete-=i")

-- Highlight on yank
-- cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
-- vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank()" -- this is same as long version below.
vim.api.nvim_exec(
    [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
    false
)


-- Reload file if it changes outside nvim
-- Current Usecase: :Sad old new
-- https://www.reddit.com/r/neovim/comments/f0qx2y/automatically_reload_file_if_contents_changed/
vim.api.nvim_exec(
  [[
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
       autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  ]], false
)

-- Move Lines with Alt-Up and Alt-Down
vim.api.nvim_exec(
    [[
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => Move Lines with Alt-Up and Alt-Down
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Move Lines - Start
  " Normal mode
  nnoremap <M-Down> :m .+1<CR>==
  nnoremap <M-Up>   :m .-2<CR>==

  " Insert mode
  inoremap <M-Down> <ESC>:m .+1<CR>==gi
  inoremap <M-Up>   <ESC>:m .-2<CR>==gi

  " Visual mode
  vnoremap <M-Down> :m '>+1<CR>gv=gv
  vnoremap <M-Up>   :m '<-2<CR>gv=gv

  " Move Lines - End
]],
    false
)

-- Toggle Zoom
vim.api.nvim_exec(
    [[
  function! ToggleZoom(zoom)
    if exists("t:restore_zoom") && (a:zoom == v:true || t:restore_zoom.win != winnr())
        exec t:restore_zoom.cmd
        unlet t:restore_zoom
    elseif a:zoom
        let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
        exec "normal \<C-W>\|\<C-W>_"
    endif
  endfunction

  augroup restorezoom
      au WinEnter * silent! :call ToggleZoom(v:false)
  augroup END
  nnoremap <silent> <Leader>+ :call ToggleZoom(v:true)<CR>
]],
    false
)

-- Title String
-- let &g:titlestring="%{expand('%:p:~:.')}%(%m%r%w%) %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"
vim.api.nvim_exec(
    [[
  let &g:titlestring="%{expand('%:p:~:.')}%(%m%r%w%) %<\[%{fnamemodify(getcwd(), ':~')}\]"
]],
    false
)

-- Y yank until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})

-- auto-session
-- require('auto-session').setup {auto_session_enable_last_session = true}

-- lsp-rooter
require("lsp-rooter").setup {ignore_lsp = {"efm"}}

-- Neogit
--[[ local neogit = require('neogit')
neogit.setup {} ]]
-- Vgit
require("vgit").setup()


-- ray-x/sad.nvim
require'sad'.setup({
  diff = 'delta', -- you can use `diff`, `diff-so-fancy`
  ls_file = 'fd', -- also git ls_file
  exact = false, -- exact match

})

-- NVimTree
require "nvim-tree".setup {
    update_focused_file = {
        -- enables the feature
        enable = true,
        -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
        -- only relevant when `update_focused_file.enable` is true
        update_cwd = true,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
        ignore_list = {}
    }
}

-- gitlinker
require "gitlinker".setup(
    {
        opts = {
            remote = nil, -- force the use of a specific remote
            -- adds current line nr in the url for normal mode
            add_current_line_on_normal_mode = true,
            -- callback for what to do with the url
            action_callback = require "gitlinker.actions".copy_to_clipboard,
            -- print the url after performing the action
            print_url = true
        },
        callbacks = {
            ["github.com"] = require "gitlinker.hosts".get_github_type_url,
            ["gitlab.com"] = require "gitlinker.hosts".get_gitlab_type_url
        },
        -- default mapping to call url generation with action_callback
        mappings = "<leader>gy"
    }
)

-- kommentary
require("kommentary.config").configure_language("lua", {prefer_single_line_comments = true})

-- surround
require "surround".setup {}
-- vim.g.surround_prefix = "m"

-- symbols-outline
map("n", "<leader>tt", [[<Cmd>:SymbolsOutline<CR>]], opt)

-- NeoTerm
vim.g.neoterm_shell = "zsh"
vim.g.neoterm_auto_repl_cmd = 0
-- " let g:neoterm_size = 16
vim.g.neoterm_autoscroll = "1"
vim.g.neoterm_default_mod = "vertical"

map("n", "<C-h>", [[<Cmd>:Ttoggle<CR>]], opt)
map("n", "<leader>tl", [[<Cmd>:TREPLSendLine<CR>]], opt)
map("n", "<leader>ts", [[<Cmd>:TREPLSendSelection<CR>]], opt)
map("v", "<leader>ts", [[<Cmd>:TREPLSendSelection<CR>]], opt)

map("n", "<C-j>", [[<Cmd>:TREPLSendLine<CR>]], opt)
map("v", "<C-j>", [[<Cmd>:TREPLSendSelection<CR>]], opt)

map("n", "<C-l>", [[<Cmd>:T clear<CR>]], opt)

-- Hardline
require("hardline").setup {
    bufferline = false, -- enable bufferline
    theme = "nord", -- change theme
    sections = {
        -- define sections
        {class = "mode", item = require("hardline.parts.mode").get_item},
        {class = "high", item = require("hardline.parts.git").get_item, hide = 80},
        "%<",
        {class = "med", item = require("hardline.parts.filename").get_item},
        {class = "med", item = "%="},
        {class = "low", item = require("hardline.parts.wordcount").get_item, hide = 80},
        {class = "error", item = require("hardline.parts.lsp").get_error},
        {class = "warning", item = require("hardline.parts.lsp").get_warning},
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
vim.g.indentLine_char = "│"
vim.g.indent_blankline_char = "│"
-- vim.g.indentLine_faster = 1
-- vim.g.indentLine_setConceal = 2
-- vim.g.indentLine_concealcursor = ""
-- vim.g.indentLine_bufNameExclude = {"term:.*"}

-- Compe
require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = {
        border = {"", "", "", " ", "", "", "", " "}, -- the border option is the same as `|help nvim_open_win|`
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
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

--  Compe: Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn["vsnip#available"](1) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
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
require "hop".setup()
vim.api.nvim_command("highlight HopNextKey guifg=none guibg=none gui=none ctermfg=none cterm=bold")
vim.api.nvim_command("highlight HopNextKey1 guifg=none guibg=none gui=none ctermfg=none cterm=bold")
vim.api.nvim_command("highlight HopNextKey2 guifg=none guibg=none gui=none ctermfg=none")
vim.api.nvim_command("highlight HopUnmatched guifg=none guibg=none guisp=none ctermfg=none")

vim.api.nvim_set_keymap("n", "f", "<cmd>lua require'hop'.hint_char1()<cr>", {})

--  vim.api.nvim_command('highlight HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')

-- nvim-autopairs
require("nvim-autopairs").setup()
-- require("nvim-autopairs.completion.compe").setup({
--     map_cr = true, --  map <CR> on insert mode
--     map_complete = true -- it will auto insert `(` after select function or method item
-- })

-- gitsigns
require("gitsigns").setup()

-- vim-test
vim.api.nvim_set_keymap("n", "t<C-n>", "<Cmd>TestNearest<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "tn",     "<Cmd>TestNearest<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<C-m>",     "<Cmd>TestNearest<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "t<C-f>", "<Cmd>TestFile<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "tf",     "<Cmd>TestFile<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "t<C-s>", "<Cmd>TestSuite<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "t<C-l>", "<Cmd>TestLast<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "tl",     "<Cmd>TestLast<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<c-x>",     "<Cmd>TestLast<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "t<C-v>", "<Cmd>TestVisit<CR>", {silent = true, noremap = true})

-- LSP Kind
require("lspkind").init()

-- Git Diffview
local cb = require "diffview.config".diffview_callback

require "diffview".setup {
    diff_binaries = false, -- Show diffs for binaries
    use_icons = true, -- Requires nvim-web-devicons
    file_panel = {width = 35},
    key_bindings = {
        disable_defaults = false, -- Disable the default key bindings
        -- The `view` bindings are active in the diff buffers, only when the current
        -- tabpage is a Diffview.
        view = {
            ["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
            ["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
            ["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
            ["<leader>b"] = cb("toggle_files") -- Toggle the files panel.
        },
        file_panel = {
            ["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
            ["<down>"] = cb("next_entry"),
            ["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
            ["<up>"] = cb("prev_entry"),
            ["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
            ["o"] = cb("select_entry"),
            ["<2-LeftMouse>"] = cb("select_entry"),
            ["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
            ["S"] = cb("stage_all"), -- Stage all entries.
            ["U"] = cb("unstage_all"), -- Unstage all entries.
            ["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
            ["<tab>"] = cb("select_next_entry"),
            ["<s-tab>"] = cb("select_prev_entry"),
            ["<leader>e"] = cb("focus_files"),
            ["<leader>b"] = cb("toggle_files")
        }
    }
}

-- Trouble
require("trouble").setup {}
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap(
    "n",
    "<leader>xw",
    "<cmd>Trouble lsp_workspace_diagnostics<cr>",
    {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})

-- Treesitter
-- require'nvim-treesitter.configs'.setup {
--     ensure_installed = {"elixir","javascript"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--     highlight = {
--         enable = true, -- false will disable the whole extension
--         disable = {"c", "rust"}, -- list of language that will be disabled
--         -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--         -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--         -- Using this option may slow down your editor, and you may see some duplicate highlights.
--         -- Instead of true it can also be a list of languages
--         additional_vim_regex_highlighting = false
--     }
-- }

-- Telescope
-- require("telescope").setup {
--     defaults = {
--         -- Your defaults config goes in here
--     },
--     pickers = {
--         -- Your special builtin config goes in here
--         buffers = {
--             sort_lastused = true,
--             theme = "dropdown",
--             -- previewer = false,
--             mappings = {
--                 i = {
--                     ["<c-d>"] = require("telescope.actions").delete_buffer,
--                     -- Right hand side can also be the name of the action as a string
--                     ["<c-d>"] = "delete_buffer"
--                 },
--                 n = {["<c-d>"] = require("telescope.actions").delete_buffer}
--             }
--         },
--         find_files = {theme = "dropdown"}
--     },
--     extensions = {
--         -- Your extension config goes in here
--     }
-- }

-- Key Mappings
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt) -- Toggle Number
map("n", "<leader>m", [[ <Cmd> !mix format %<CR>]], {silent = true, noremap = true}) -- Toggle Number
map("n", "<leader>r", [[ <Cmd> source ~/.config/nvim/init.lua<CR>]], opt) -- Source $MYVIMRC
map("n", "ß", [[<Cmd>:w <CR>]], opt) -- Save - Cmd+s
map("i", "ß", [[<Cmd>:w <CR>]], opt) -- Save - Cmd+s
map("n", "∑", [[<Cmd>:q <CR>]], opt) -- Quit - Cmd+w
map("n", "<c-q>", [[<Cmd>:q <CR>]], opt) -- Quit
map("n", "bn", [[<Cmd>:q <CR>]], opt) -- Quit - `bn` in Normal mode
map("n", "<leader>hl", [[<Cmd>set invhlsearch<CR>]], opt) -- Toggle Search Highlight
map("n", "<leader>d", [[ <Cmd> bd<CR>]]) -- Close the buffer
map("n", "bd", [[<Cmd> bd <CR>]], opt) -- Close the buffer
map("n", "<leader>ps", [[ <Cmd> PaqSync<CR>]]) -- Sync = install + update the plugins
map("n", "∫", [[ <Cmd> NvimTreeToggle<CR>]]) -- Cmd+b Open NvimTree Sidebar
map("n", "<C-e>", [[ <Cmd> NvimTreeToggle<CR>]]) -- Open NvimTree Sidebar
map("n", "ƒ", [[<Cmd> Telescope find_files theme=get_dropdown<CR>]]) -- Find Files
map("n", "ƒ", [[<Cmd> Files<CR>]]) -- Find Files
map("n", "<leader>m", [[<Cmd> Rg<CR>]]) -- Find Buffers
map("n", "<leader>b", [[<Cmd> Telescope buffers theme=get_dropdown<CR>]]) -- Find Buffers
map("n", "<leader>b", [[<Cmd> Buffers<CR>]]) -- Find Buffers
map("n", "<leader>s", [[<Cmd> Telescope live_grep theme=get_dropdown<CR>]]) -- Find Buffers
map("n", "∆", [[<Cmd> TBD<CR>]]) -- Cmd+Shift+j unmapped for now
map("n", "<C-p>", [[<Cmd> Telescope git_files theme=get_dropdown<CR>]], opt)
map("n", "<C-p>", [[<Cmd> GFiles --exclude-standard --others --cached<CR>]], opt)
map("n", "π", [[<Cmd> Telescope commands theme=get_dropdown<CR>]], opt) -- Cmd+p Dropdown with commands
map("n", "π", [[<Cmd> Files<CR>]], opt) -- Cmd+p Dropdown with commands
map("n", "¬", [[<Cmd> LazyGit<CR>]], opt) -- Cmd+l Lazygit
map("n", "<S-s>", [[<Cmd>Telescope builtin<CR>]], opt) -- Telescope builtin things
map("n", ";;", "<C-^>", opt) -- goto pervious file fast
map("n", "<leader>;", ":", opt) -- Run commad in command-mode. i.e. at bottom of nvim's commandline.
map("x", "<leader>;", ":", opt) -- Run commad in command-mode. i.e. at bottom of nvim's commandline.
map("n", "<c-c>", ":", opt) -- Run commad in command-mode. i.e. at bottom of nvim's commandline.
map("x", "<c-c>", ":", opt) -- Run commad in command-mode. i.e. at bottom of nvim's commandline.

-- Quickly add empty lines
map("n", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<cr>", opt)
map("n", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<cr>", opt)

-- Allow easy navigation between wrapped lines.
map("v", "j", "gj", opt)
map("v", "k", "gk", opt)
map("n", "j", "gj", opt)
map("n", "k", "gk", opt)

-- Paste the last thing yanked
map("n", ",p", '"0p', opt)
map("n", ",P", '"0P', opt)

-- Buffer Navigation
map("n", "<right>", [[<Cmd>:bnext<CR>]], opt) -- Next Buffer
map("n", "<left>", [[<Cmd>:bprevious<CR>]], opt) -- Previous Buffer
map("n", "<up>", [[<Cmd>:tabnext<CR>]], opt) -- Next Tab
map("n", "<down>", [[<Cmd>:tabprev<CR>]], opt) -- Previous Tab

-- Press * to search for the term under the cursor or a visual selection and
-- then press a key below to replace all instances of it in the current file.
map("n", "<leader>r", [[:%s///g<Left><Left>]])
map("n", "<leader>rc", [[:%s///gc<Left><Left><Left>]])



-- Yank, delete and paste will use the x register
-- map("n", "y", '"0y', opt)
-- map("x", "y", '"0y', opt)
-- map("n", "Y", '"0y$', opt)

-- map("n", "d", '"0d', opt)
-- map("x", "d", '"0d', opt)
-- map("n", "D", '"0D', opt)
-- map("n", "p", '"0p', opt)
-- map("x", "p", '"0P', opt)
-- map("x", "P", '"0P', opt)


-----------------------------------------------------------------------------------------------
---  LSP
-----------------------------------------------------------------------------------------------
local nvim_lspp = require("lspconfig")
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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

    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 2000)<CR>", opts)
end

-- LSP: LUA
-- Link: https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/
USER = vim.fn.expand("$USER")
local sumneko_binary = "/Users/" .. USER .. "/language-servers/lua-language-server/bin/macOS/lua-language-server"
local sumneko_root_path = "/Users/" .. USER .. "/language-servers/lua-language-server"
nvim_lspp.sumneko_lua.setup {
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

-- EFM - Mainly for credo, and luafmt as of now
nvim_lspp.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua", "elixir"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            }
        }
    }
}

-- Format on save
-- When multiple LSPs are involved (e.g. elixirls & efm) then to avoid choosing which one to use, always use `formatting_seq_sync` instead of `formatting_sync`
vim.api.nvim_command("autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_seq_sync(nil, 2000)")
vim.api.nvim_command("autocmd BufWritePre *.ex,*.exs lua vim.lsp.buf.formatting_seq_sync(nil, 2000)")

-- LSP: Elixir
-- Don't forget to build the language-server first.
-- Try to choose the most recent tag possible.
-- Link: https://www.mitchellhanberg.com/how-to-set-up-neovim-for-elixir-development/?utm_medium=email&utm_source=elixir-radar
local path_to_elixirls = vim.fn.expand("/Users/" .. USER .. "/language-servers/elixir-ls/release/language_server.sh")
nvim_lspp.elixirls.setup(
    {
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
    }
)

-- Elixir Pipes:
-- Adds |> when we press <C-l>,
-- Adds |> IO.inspect(label: "here") when we press <C-h>
vim.api.nvim_exec(
    [[
augroup elixirbindings
  autocmd! elixirbindings
  autocmd Filetype elixir imap <buffer> <silent> <C-l> \|>
  autocmd Filetype elixir imap <buffer> <silent> <C-h> \|> IO.inspect(label: "Here")
  " autocmd Filetype elixir imap <buffer> <silent> <C-m> %{}
augroup end
]],
    false
)

-- Set Syntax for different file extension
vim.api.nvim_exec(
    [[
augroup extension_syntax_setting
  autocmd! extension_syntax_setting
  autocmd BufNewFile,BufRead *.env,*.local,*.env.local,*.uat,*.prod,*.envrc,*.in set syntax=zsh
  autocmd BufNewFile,BufRead *.env.local set syntax=zsh
augroup end
]],
    false
)
