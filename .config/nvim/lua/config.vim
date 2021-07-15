"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MapLeader - Space as MapLeader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set mapleader to space, and timeout length for the key is 8 sec now.
" Require less than one second between keys for mappings to work correctly
let mapleader =" "
set timeoutlen=1000

" Set terminal to vim-test
let g:test#strategy = 'terminal'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bare Essentials
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hides buffers instead of closing them
" Allow switching buffers with unwritten changes
set hidden

" Yank and paste with the system clipboard
set clipboard=unnamed

" Only one line for command line
set cmdheight=2

" Auto-reloading a file in VIM as soon as it changes on disk
set autoread
autocmd FocusGained,BufEnter * checktime


" ColorScheme
"autocmd vimenter * colorscheme gruvbox
colorscheme gruvbox

" HighlightedyankRegion - vim plugin
" HighlightedyankRegionpumvisible() ? "\" : "\
" highlight HighlightedyankRegion cterm=reverse gui=reverse

augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=100 }
augroup END

" Mouse support
set mouse=a

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" don't syntax-highlight long lines
set synmaxcol=1000

" Split with predictability
set splitbelow
set splitright

"set signcolumn so that screen don't flcuate when we don't have it.
" set signcolumn=yes:1 
set signcolumn=number

"set number
set number


" PopupMenu keys
inoremap <expr><C-J> pumvisible() ? "\<C-n>" : "\<C-J>"
inoremap <expr><C-K> pumvisible() ? "\<C-p>" : "\<C-K>"

" Keep the selection after indenting
xnoremap <  <gv
xnoremap >  >gv

" Insted of Y mapping to yy, make it like C, D etc. - Consistency
nnoremap Y y$
xnoremap Y <Esc>y$gv


" From https://github.com/sheerun/dotfiles/blob/master/vimrc
" Let's Keep only M from H(high) M(middle) L(low)
nnoremap H 0
nnoremap L $

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" Faster keyword completion - for <ctrl-j,k>, <ctrl-n,p>
" disable scanning included files
set complete-=i


" realtime search view
set inccommand=nosplit

" Syntax Highlight only first 200 columns - to keep vim fast
set synmaxcol=200

set title
" Title length.
set titlelen=95
" Title string.
let &g:titlestring="
      \ %{expand('%:p:~:.')}%(%m%r%w%)
      \ %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"


" Paste the last thing you yanked, not deleted
nmap ,p "0p
nmap ,P "0P



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable searching tags. Try to keep vim fast.
set complete-=t

" Sane hl_search
" noremap  <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
" noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

" fu! HlSearch()
"     let s:pos = match(getline('.'), @/, col('.') - 1) + 1
"     if s:pos != col('.')
"         call StopHL()
"     endif
" endfu

" fu! StopHL()
"     if !v:hlsearch || mode() isnot 'n'
"         return
"     else
"         sil call feedkeys("\<Plug>(StopHL)", 'm')
"     endif
" endfu

" augroup SearchHighlight
" au!
"     au CursorMoved * call HlSearch()
"     au InsertEnter * call StopHL()
" augroup end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Experimental
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set autowriteall
" treat dash separated words as a word text object"
set iskeyword+=-


let g:rooter_change_directory_for_non_project_files = 'current'
" This is good but makes vim slow - use zi,za,zc and frieds
" set nofoldenable
set foldmethod=syntax
set foldlevel=2

" auto-remove trailing whitespaces
" autocmd BufWritePre * :%s/\s\+$//e

" Tags
" use relative paths for tags
" set tagrelative

" tags file paths
" set tags=./tags,tags

" nnoremap <leader>lf <C-^>
" Switch to previous buffer
nnoremap ;; <C-^>

" ONLY KEEP LINES WHICH CONTAIN SEARCH
nnoremap ,v :v/<C-R>//d<CR>gg
nnoremap ,d :g/<C-R>//d<CR>gg

" Visually select the text that was last edited/pasted (Vimcast#26). #sheerun
noremap gV `[v`]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => StripTrailingWhiteSpace, Quickly add empty lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function StripTrailingWhiteSpace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
command! StripTrailingWhiteSpace call StripTrailingWhiteSpace()

" Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ToggleZoom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev E e
cnoreabbrev b Buffers
cnoreabbrev H History

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Wildmode (experimental)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=longest,list,full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Arrow Keys - Normal Mode - Buffer - Tabs navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <left>  :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up>    :tabnext<CR>
nnoremap <down>  :tabprev<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs - Normal Mode - Buffer - Tabs navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>tc :tabe<CR>
nnoremap <Leader>tx :tabclose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Unix as the standard file type
set ffs=unix,dos,mac

" Encoding - utf-8
scriptencoding utf-8
set encoding=utf-8

" Enable filetype plugins
filetype plugin on
filetype indent on

" Keep some lines visible when scrolling to edges of screen
set scrolloff=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts, Highlights
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark

" Always show tabs
" 0 - Hide tabline
" 1 - Show tabline when we explicitly create a new tab
" 2 - Always show the tabline
set showtabline=1

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Makes popup menu smaller
set pumheight=10


" Show tabs, empty spacces etc.
let &listchars="tab:┆\ ,trail:▫,nbsp:_,extends:»,precedes:«,eol:¬"

" Enable theming support
" As I'm using kitty - it's not required for now.
if (has("termguicolors"))
  set termguicolors
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results
set hlsearch
" Ignore case
set ignorecase
" Ignore case if lower
set smartcase


if has('nvim')
    set inccommand=nosplit  " Incremental highlight during :%s
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in git etc. anyway...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab settings, Indent Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" do not wrap long lines by default
set nowrap

" Linebreak on 500 characters
set lbr
set tw=500

"Auto indent
set autoindent

"Smart indent
set smartindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Where to save undo histories
set undodir=$HOME/.config/nvim/undo

" Save undo's after file closes
set undofile

" How many undos
set undolevels=100

" Number of lines to save for undo
set undoreload=2000



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC VIM - Start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC VIM - End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Elixir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:mix_format_on_save = 1
augroup elixirbindings
  autocmd! elixirbindings
  autocmd Filetype elixir imap <buffer> <silent> <C-l> \|>
  autocmd Filetype elixir imap <buffer> <silent> <C-h> \|> IO.inspect(label: "Here")
  autocmd BufWritePre *.ex lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.exs lua vim.lsp.buf.formatting()
  " autocmd Filetype elixir imap <buffer> <silent> <C-m> %{}
augroup end



au! BufWritePost $MYVIMRC source %
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" something related to automatically apply vim-file changes
" https://github.com/hardcoreplayers/ThinkVim/blob/develop/core/filetype.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroup user_plugin_filetype "{{{

"   autocmd!
"   " Reload vim config automatically
"   " $HOME/.config/nvim/general/paths.vim
"   autocmd BufWritePost $HOME/.config/{*.vim,*.yaml,vimrc} nested
"         \ source $MYVIMRC | redraw

"   " Reload Vim script automatically if setlocal autoread
"   autocmd BufWritePost,FileWritePost *.vim nested
"         \ if &l:autoread > 0 | source <afile> |
"         \   echo 'source ' . bufname('%') |
"         \ endif

" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" References
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" https://vi.stackexchange.com/questions/21051/reduce-size-of-undo-file
" https://github.com/3N4N/dotFiles/blob/master/.config/nvim/init.vim
" https://github.com/mhinz/vim-galore
" https://github.com/ibhagwan/dots/blob/master/README-vim.md
" https://github.com/weirongxu/dotvim/blob/master/options.rc.vim
" https://github.com/sheerun/vimrc



" Reload vimrc
nnoremap <space>r :source $MYVIMRC<cr>

" Useful leader mappings
nnoremap <Leader>; :
xnoremap <Leader>; :
nnoremap <c-c> :
xnoremap <c-c> :
nnoremap <Leader>h :nohlsearch<CR>


command! StripTrailingWhiteSpace call StripTrailingWhiteSpace()



" alt+b => cmd+b for Coc Explore
nnoremap <silent>∫ :NvimTreeToggle<CR>


" Goto File
nnoremap <Leader>g gf


" alt+s = cmd+s for saving the file
" Fast saving
nnoremap <Leader>w :w<CR>
nnoremap <silent>ß :w<CR>
vnoremap <silent>ß  <C-C>:update<CR>
inoremap <silent>ß  <C-O>:update<CR>




" Toggle key bindings
"  noremap <silent> <Leader>tc :let &colorcolumn=(&cc==0)?81:0<CR>
nnoremap <silent> <Leader>te :set expandtab!<Bar>set expandtab?<CR>
nnoremap <silent> <Leader>th :set hlsearch!<Bar>set hlsearch?<CR>
nnoremap <silent> <Leader>tln :set nu!<Cr>
nnoremap <silent> <Leader>tr :set relativenumber!<Cr>
nnoremap <silent> <Leader>tf :set foldenable!<Cr>
nnoremap <silent> <Leader>tp :set paste!<Bar>set paste?<CR>
" nnoremap <silent> <Leader>ts :setlocal spell!<Bar>setlocal spell?<CR>
nnoremap <silent> <Leader>ts :syntax off<CR>
nnoremap <silent> <Leader>to :syntax on<CR>
nnoremap <silent> <Leader>tw :set wrap!<Bar>set wrap?<CR>
nnoremap <silent> <Leader>tm :let &mouse=(&mouse==#""?"a":"")<Bar>
			\ echo "mouse ".(&mouse==#""?"off":"on")<CR>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [plugin] indent-blankline - START
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &diff
    let g:indent_blankline_enabled = v:false
endif

let g:indent_blankline_char = '▏'
let g:indent_blankline_filetype_exclude = [
    \ 'cheat40', 'fern', 'help', 'text', 'undotree', 'yaml'
    \]
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_use_treesitter = v:true
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [plugin] indent-blankline - END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap('<c-]>', '<cmd>lua vim.lsp.buf.definition()<cr>')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [plugin] NeoTerm - START
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoTerm
" set nocompatible
" filetype off
" let &runtimepath.=',~/.vim/bundle/neoterm'
" silent! helptags ALL

let g:neoterm_autoscroll = '1'
" let g:neoterm_size = 16
let g:neoterm_default_mod = 'vertical'

nnoremap <leader>tt :Ttoggle<CR>
nnoremap <leader>tt :Ttoggle<CR>
" nnoremap <leader>tl :TREPLSendLine<CR>
" nnoremap <c-l> :TREPLSendLine<CR>
" nnoremap <leader>ts :TREPLSendSelection<CR>
" vnoremap <leader>ts :TREPLSendSelection<CR>


" Use gx{text-object} in normal mode
nmap gx <Plug>(neoterm-repl-send)

" Send selected contents in visual mode.
xmap gx <Plug>(neoterm-repl-send)

" Send lines to Neoterm repl
nmap gxx <Plug>(neoterm-repl-send-line)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [plugin] indent-blankline - END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [plugin] Telescope - START
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <silent>π <cmd>Telescope find_files<cr>
nnoremap <silent>π <cmd>Telescope find_files<cr>
nnoremap <silent>∏ <cmd>Telescope commands<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [plugin] Telescope - END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [plugin] LSP-SAGA - START
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" -- or use command LspSagaFinder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>

nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>


" -- show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" -- or use command
nnoremap <silent>K :Lspsaga hover_doc<CR>

" -- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" -- scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent> gs :Lspsaga signature_help<CR>

nnoremap <silent> gd :Lspsaga preview_definition<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [plugin] Telescope - END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gsd <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gsw <cmd>lua vim.lsp.buf.workspace_symbol()<CR>



" -- lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" -- or use command LspSagaFinder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
