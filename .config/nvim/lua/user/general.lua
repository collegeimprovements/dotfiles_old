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

-- Highlight on yank
-- cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
-- vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank()" -- this is same as long version below.
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]] ,
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
]] ,
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
]] ,
  false
)


-- Title String
-- let &g:titlestring="%{expand('%:p:~:.')}%(%m%r%w%) %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"
vim.api.nvim_exec(
  [[
  let &g:titlestring="%{expand('%:p:~:.')}%(%m%r%w%) %<\[%{fnamemodify(getcwd(), ':~')}\]"
]] ,
  false
)

-- " Keep the selection after indenting
vim.api.nvim_set_keymap("x", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("x", ">", ">gv", { noremap = true })

-- Source $MYVIMRC after saving
vim.cmd("au! BufWritePost $MYVIMRC source %")
