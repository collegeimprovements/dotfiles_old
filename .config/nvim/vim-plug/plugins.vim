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
  " Plug 'jiangmiao/auto-pairs'
  " Plug 'tpope/vim-endwise'
  " Plug 'arthurxavierx/vim-caser'
  " Plug 'farmergreg/vim-lastplacegit'
  " Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'AndrewRadev/switch.vim'
  Plug 'airblade/vim-rooter'
  Plug 'andyl/vim-textobj-elixir'
  Plug 'andymass/vim-matchup'
  Plug 'chriskempson/base16-vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'elixir-editors/vim-elixir'
  Plug 'itchyny/lightline.vim'
  Plug 'jparise/vim-graphql'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'kana/vim-textobj-user'
  Plug 'kassio/neoterm'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
  Plug 'machakann/vim-sandwich'
  Plug 'machakann/vim-swap'
  Plug 'mhartington/oceanic-next'
  Plug 'mhinz/vim-signify'
  Plug 'mhinz/vim-startify'
  Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pechorin/any-jump.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'terryma/vim-expand-region'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-unimpaired'
  Plug 'voldikss/vim-floaterm'
  Plug 'yilin-yang/vim-markbar'
  Plug 'antoinemadec/coc-fzf'
  Plug 'vn-ki/coc-clap'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

