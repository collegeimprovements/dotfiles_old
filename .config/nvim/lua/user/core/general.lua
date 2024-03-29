------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-- key-bindings - function to map keys and commands
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

-- Reload file if it changes outside nvim
-- Current Usecase: :Sad old new
-- https://www.reddit.com/r/neovim/comments/f0qx2y/automatically_reload_file_if_contents_changed/
vim.api.nvim_exec(
	[[
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
       autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  ]],
	false
)

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

-- Y yank until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

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

-- Better move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

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

-- Set Syntax for different file extension
vim.api.nvim_exec(
	[[
augroup extension_syntax_setting
  autocmd! extension_syntax_setting
  autocmd BufNewFile,BufRead *.env,*.local,*.env.local,*.uat,*.prod,*.envrc,*.in,*.dockerignore,*.env* set syntax=zsh
augroup end
]],
	false
)

-- " Keep the selection after indenting
keymap("x", "<", "<gv", { noremap = true })
keymap("x", ">", ">gv", { noremap = true })

-- Source $MYVIMRC after saving
vim.cmd("au! BufWritePost $MYVIMRC source %")

-- Copy Paste Better
keymap("v", "p", '"_dp', opts)

-- Quickly add empty lines
map("n", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<cr>", opts)
map("n", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<cr>", opts)

-- Allow easy navigation between wrapped lines.
map("v", "j", "gj", opts)
map("v", "k", "gk", opts)
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Paste the last thing yanked
-- map("n", ",p", '"0p', opts)
-- map("n", ",P", '"0P', opts)

-- Buffer Navigation
map("n", "<right>", [[<Cmd>:bnext<CR>]], opts) -- Next Buffer
map("n", "<left>", [[<Cmd>:bprevious<CR>]], opts) -- Previous Buffer
map("n", "<up>", [[<Cmd>:tabnext<CR>]], opts) -- Next Tab
map("n", "<down>", [[<Cmd>:tabprev<CR>]], opts) -- Previous Tab

-- Press * to search for the term under the cursor or a visual selection and
-- then press a key below to replace all instances of it in the current file.
map("n", "<leader>r", [[:%s///g<Left><Left>]])
map("n", "<leader>rc", [[:%s///gc<Left><Left><Left>]])

-- Use `<ESC>` or `q` to close windows
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"fugitive",
		"help",
		"lspinfo",
		"lspsagafinder",
		"man",
		"null-ls-info",
		"qf",
		"sagacodeaction",
		"startuptime",
		"lazy",
		"checkhealth",
		"health://",
	},
	callback = function()
		vim.keymap.set({ "n" }, "<ESC>", "<cmd>close<CR>", { silent = true, buffer = true })
		vim.keymap.set({ "n" }, "q", "<cmd>close<CR>", { silent = true, buffer = true })
	end,
})

--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	command = [[:%s/\s\+$//e]],
	group = TrimWhiteSpaceGrp,
})

-- html
vim.api.nvim_exec(
	[[
    let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.heex'
    let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.heex'
  ]],
	false
)

-- Did you know that you can automatically jump to the last place you’ve visited in a file before exiting?
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
