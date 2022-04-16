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
opt.backspace = { "indent", "eol", "start" }
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
opt.signcolumn = "yes:1" -- always show signcolumns
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
opt.wildignore = opt.wildignore({
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
  "*/_build/**",
})

opt.wildmode = { "longest", "list", "full" }

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17

opt.wildmode = opt.wildmode - "list"
opt.wildmode = opt.wildmode + { "longest", "full" }

vim.cmd("let &fcs='eob: '") -- disable tilde on end of buffer: https://github.com/  neovim/neovim/pull/8546#issuecomment-643643758

vim.cmd("au FocusGained * checktime") -- AutoRead on buffer focusgained

-- Command Mode Abbreviations
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Bd bd")
vim.cmd("cnoreabbrev wrap set wrap")
vim.cmd("cnoreabbrev nowrap set nowrap")

-- disable builtin vim plugins
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }
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

-- " Keep the selection after indenting
vim.api.nvim_set_keymap("x", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("x", ">", ">gv", { noremap = true })

-- " Faster keyword completion - for <ctrl-j,k>, <ctrl-n,p>
-- " disable scanning included files
vim.cmd("set complete-=i")

-- Treat word with hyphen(-) as single word.
-- https://www.youtube.com/watch?v=hY5-Q6NxQgY&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=2
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
