
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MapLeader - Space as MapLeader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set mapleader to space, and timeout length for the key is 8 sec now.
let mapleader =" "
set timeoutlen=1000

" Useful leader mappings
nnoremap <Leader>; :
xnoremap <Leader>; :
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <silent> <leader>b :CocCommand explorer<CR>

noremap <silent> <D-s> :w<CR>


" Toggle key bindings
nnoremap <silent> <Leader>tc :let &colorcolumn=(&cc==0)?81:0<CR>
nnoremap <silent> <Leader>te :set expandtab!<Bar>set expandtab?<CR>
nnoremap <silent> <Leader>th :set hlsearch!<Bar>set hlsearch?<CR>
nnoremap <silent> <Leader>tln :set nu!<Cr>
nnoremap <silent> <Leader>tr :set relativenumber!<Cr>
nnoremap <silent> <Leader>tf :set foldenable!<Cr>
nnoremap <silent> <Leader>tp :set paste!<Bar>set paste?<CR>
nnoremap <silent> <Leader>ts :setlocal spell!<Bar>setlocal spell?<CR>
nnoremap <silent> <Leader>tw :set wrap!<Bar>set wrap?<CR>
nnoremap <silent> <Leader>tm :let &mouse=(&mouse==#""?"a":"")<Bar>
			\ echo "mouse ".(&mouse==#""?"off":"on")<CR>


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
au FocusGained,BufEnter * checktime

" ColorScheme
"autocmd vimenter * colorscheme gruvbox
colorscheme gruvbox


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


" PopupMenu keys
inoremap <expr><C-J> pumvisible() ? "\<C-n>" : "\<C-J>"
inoremap <expr><C-K> pumvisible() ? "\<C-p>" : "\<C-K>"

" Keep the selection after indenting
xnoremap <  <gv
xnoremap >  >gv

" Insted of Y mapping to yy, make it like C, D etc. - Consistency
nnoremap Y y$
xnoremap Y <Esc>y$gv


" Faster keyword completion - for <ctrl-j,k>, <ctrl-n,p>
" disable scanning included files
set complete-=i   

" disable searching tags
set complete-=t   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Experimental
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autowriteall
" treat dash separated words as a word text object"
set iskeyword+=-
let g:rooter_change_directory_for_non_project_files = 'current'
 
" This is good but makes vim slow - use zi,za,zc and frieds 
" set nofoldenable
set foldmethod=syntax

" Syntax Highlight only first 200 columns - to keep vim fast
set synmaxcol=200  

"Open DBUI drawer on right
let g:db_ui_win_position = 'right'

"Use nerd fonts for DBUI
let g:db_ui_use_nerd_fonts = 1
let g:db_async = 1

" Tags
" use relative paths for tags
" set tagrelative

" tags file paths
" set tags=./tags,tags

" nnoremap <leader>lf <C-^>
" Switch to previous buffer
nnoremap ;; <C-^>

augroup elixirbindings
  autocmd! elixirbindings 
  autocmd Filetype elixir imap <buffer> <silent> <C-l> \|> 
augroup end

" Move Lines - Start
" Normal mode
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==

" Insert mode
" inoremap <C-j> <ESC>:m .+1<CR>==gi
" inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv

" Move Lines - End



" Sane hl_search
noremap <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

fu! HlSearch()
    let s:pos = match(getline('.'), @/, col('.') - 1) + 1
    if s:pos != col('.')
        call StopHL()
    endif
endfu

fu! StopHL()
    if !v:hlsearch || mode() isnot 'n'
        return
    else
        sil call feedkeys("\<Plug>(StopHL)", 'm')
    endif
endfu

augroup SearchHighlight
au!
    au CursorMoved * call HlSearch()
    au InsertEnter * call StopHL()
augroup end

" NeoTerm
set nocompatible
filetype off
let &runtimepath.=',~/.vim/bundle/neoterm'

" Show tabs, empty spacces etc.
let &listchars="tab:┆\ ,trail:▫,nbsp:_,extends:»,precedes:«,eol:¬"     

" Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Wildmode (experimental)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=longest,list,full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Arrow Keys - Normal Mode - Buffer - Tabs navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>





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
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Makes popup menu smaller
set pumheight=10



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


au! BufWritePost $MYVIMRC source %
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" References
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" https://vi.stackexchange.com/questions/21051/reduce-size-of-undo-file
" https://github.com/3N4N/dotFiles/blob/master/.config/nvim/init.vim
" https://github.com/mhinz/vim-galore
" https://github.com/ibhagwan/dots/blob/master/README-vim.md
