" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/vim-plug/plugged')
  " Plug 'sbdchd/neoformat'
  " Plug 'kristijanhusak/vim-dadbod-completion'
  " Plug 'ludovicchabant/vim-gutentags'
  " Plug 'liuchengxu/vista.vim'
  " Plug 'junegunn/rainbow_parentheses.vim'
  " Plug 'junegunn/rainbow_parentheses.vim'
  " Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
  " Plug 'lambdalisue/gina.vim'
  " Plug 'neomake/neomake'
  Plug 'airblade/vim-rooter'
  Plug 'andymass/vim-matchup'
  Plug 'elixir-editors/vim-elixir'
  Plug 'itchyny/lightline.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'justinmk/vim-sneak'   
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'mhinz/vim-signify'
  Plug 'mhinz/vim-startify'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'rhysd/git-messenger.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-surround'
  Plug 'voldikss/vim-floaterm'
  Plug 'kassio/neoterm'
  Plug 'morhetz/gruvbox'
  Plug 'jparise/vim-graphql'
  Plug 'arcticicestudio/nord-vim'
  Plug 'mhartington/oceanic-next'
  Plug 'dstein64/vim-startuptime'
call plug#end()




" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

