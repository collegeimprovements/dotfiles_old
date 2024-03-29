local opt = vim.opt
local g = vim.g

-- [START] https://github.com/nathom/nvim_config/blob/main/lua/opts.lua#L6
-- Disable some built-in plugins we don't want
local disabled_built_ins = {
	"gzip",
	"man",
	"matchit",
	"matchparen",
	"shada_plugin",
	"tarPlugin",
	"tar",
	"zipPlugin",
	"zip",
	"netrwPlugin",
	"2html_plugin",
	"remote_plugins",
}

for _, plugin in ipairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

-- Skip some remote provider loading
g.loaded_python_provider = 0

-- Speed up startup time
-- Doesn't work with vim.opt for some reason
-- vim.cmd([[set shada="NONE"]])
-- [END] https://github.com/nathom/nvim_config/blob/main/lua/opts.lua#L6

-- File Reloading
vim.cmd([[
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])

-- Options
opt.shortmess:append("sIa") -- disable nvim intro
vim.opt.shadafile = "NONE"

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

opt.autoread = true
opt.exrc = true
opt.backup = false
opt.writebackup = false
opt.wildmenu = true
-- opt.autowriteall = true

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
opt.wildignore = opt.wildignore
	+ {
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
		"*/deps/**",
	}

-- o.wildignore = [[
-- .git,.hg,.svn
-- *.aux,*.out,*.toc
-- *.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
-- *.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
-- *.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
-- *.mp3,*.oga,*.ogg,*.wav,*.flac
-- *.eot,*.otf,*.ttf,*.woff
-- *.doc,*.pdf,*.cbr,*.cbz
-- *.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
-- *.swp,.lock,.DS_Store,._*
-- */tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
-- ]]

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
vim.cmd("cnoreabbrev Q! q!")
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

-- Set shell
-- vim.cmd("set shell=/usr/local/bin/zsh")

-- diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

-- nvim-ufo
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.shadafile = ""
