" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/vim-plug/plugged')
  " Plug 'dstein64/vim-startuptime'
  " Plug 'junegunn/rainbow_parentheses.vim'
  " Plug 'justinmk/vim-sneak'
  " Plug 'kristijanhusak/vim-dadbod-completion'
  " Plug 'lambdalisue/gina.vim'
  " Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
  " Plug 'liuchengxu/vista.vim'
  " Plug 'ludovicchabant/vim-gutentags'
  " Plug 'neomake/neomake'
  " Plug 'rhysd/git-messenger.vim'
  " Plug 'sbdchd/neoformat'
  " Plug 'tpope/vim-surround'
  " Plug 'voldikss/vim-floaterm'
  " Plug 'jiangmiao/auto-pairs'
  " Plug 'tpope/vim-endwise'
  Plug 'airblade/vim-rooter'
  Plug 'andymass/vim-matchup'
  Plug 'elixir-editors/vim-elixir'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'mhinz/vim-signify'
  Plug 'mhinz/vim-startify'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-projectionist'
  Plug 'kassio/neoterm'
  Plug 'morhetz/gruvbox'
  Plug 'jparise/vim-graphql'
  Plug 'mhartington/oceanic-next'
  Plug 'machakann/vim-swap'
  Plug 'machakann/vim-highlightedyank'
  Plug 'machakann/vim-sandwich'
  Plug 'andyl/vim-textobj-elixir'
  Plug 'kana/vim-textobj-user'
  Plug 'chriskempson/base16-vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'pechorin/any-jump.vim'
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/vim-plug/plugged')
  " Plug 'dstein64/vim-startuptime'
  " Plug 'junegunn/rainbow_parentheses.vim'
  " Plug 'justinmk/vim-sneak'
  " Plug 'kristijanhusak/vim-dadbod-completion'
  " Plug 'lambdalisue/gina.vim'
  " Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
  " Plug 'liuchengxu/vista.vim'
  " Plug 'ludovicchabant/vim-gutentags'
  " Plug 'neomake/neomake'
  " Plug 'rhysd/git-messenger.vim'
  " Plug 'sbdchd/neoformat'
  " Plug 'tpope/vim-surround'
  " Plug 'voldikss/vim-floaterm'
  " Plug 'jiangmiao/auto-pairs'
  " Plug 'tpope/vim-endwise'
  Plug 'airblade/vim-rooter'
  Plug 'andymass/vim-matchup'
  Plug 'elixir-editors/vim-elixir'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'mhinz/vim-signify'
  Plug 'mhinz/vim-startify'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-projectionist'
  Plug 'kassio/neoterm'
  Plug 'morhetz/gruvbox'
  Plug 'jparise/vim-graphql'
  Plug 'mhartington/oceanic-next'
  Plug 'machakann/vim-swap'
  Plug 'machakann/vim-highlightedyank'
  Plug 'machakann/vim-sandwich'
  Plug 'andyl/vim-textobj-elixir'
  Plug 'kana/vim-textobj-user'
  Plug 'chriskempson/base16-vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'pechorin/any-jump.vim'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

