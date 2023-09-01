set compatible

" Plugins
call plug#begin('~/.vim/plugged')
  " Navigation
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'mileszs/ack.vim', { 'on': 'Ack' }

  " Syntax Highlighting
  Plug 'othree/html5.vim', { 'for': ['html', 'php'] }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascript' }
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

  " Misc
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
  
  "Theme
  Plug 'Everblush/everblush.vim'
call plug#end()

colorscheme everblush

" Editor config
set encoding=utf-8

set showcmd
set noshowmode

set backspace=indent,eol,start
set hidden

set ignorecase
set smartcase

set number
set ruler
set cursorline

set incsearch
set hlsearch

set spelllang=en,nl

set wrap
set linebreak
set breakindent
let &showbreak=" "
set display+=lastline

set scrolloff=5

set title
set visualbell

set noswapfile
set nobackup
set nowritebackup

set history=1000
set undolevels=1000

" Configure vim path
" - .: search relative to the directory of the current file
" - **: current directory and all sub directories
set path=.,**

" Ignore paths for `path` config
" The path config sets `**` which searches everything, which can be a
" performance issue. Tell vim which directories to ignore
set wildignore=*.swp,*.swo,*.bak,*.class,*.lock,*.gitkeep,.git/**,*.lock.*
set wildignore+=**/vendor/**,**/tmp/**,tmp/**,log/**,coverage/**,doc/**
set wildignore+=**/node_modules/**,node_modules/**,*.min.js,public/packs/**,**/public/packs-test/**

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set linespace=5

set clipboard=unnamed


if (has("termguicolors"))
  set termguicolors
endif

let &colorcolumn="80,100"
let c_space_errors=1
set splitbelow
set splitright

" Configure syntax highlighting
" Reduce syntax highlighting so it doesn't hang while trying to highlight everything
syntax sync minlines=2000
syntax sync maxlines=5000
set synmaxcol=400
set redrawtime=4000
set lazyredraw

let mapleader=","
let g:font_normal="SF\ Mono\ Powerline\ Regular:h16"
let g:font_focus="SF\ Mono\ Powerline\ Regular:h20"

set shell=$SHELL
set shortmess+=IF
set shortmess-=S

runtime! config/**/*.vim
