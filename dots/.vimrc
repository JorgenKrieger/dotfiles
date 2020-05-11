set nocompatible

"" Plugins
call plug#begin('~/.vim/plugged')

" Themes
Plug 'dikiaap/minimalist'
Plug 'lewis6991/moonlight.vim'
Plug 'vim-airline/vim-airline-themes'

" Navigation
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim', { 'on' : 'Ack' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTree'] }

" Languages
Plug 'sheerun/vim-polyglot'

" Misc
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'

call plug#end()

syntax enable
colorscheme moonlight
set encoding=utf-8

set showcmd                     " Display incomplete commands
filetype plugin indent on       " Load file type plugins + indentation

"" Whitespace
set nowrap                      " Don't wrap lines
set tabstop=2                   " Global tab width
set shiftwidth=2                " Related...
set expandtab                   " Use spaces, not tabs
set backspace=indent,eol,start  " Backspace through everything in insert mode

"" Searching
set hlsearch                    " Highlight matches
set incsearch                   " Incremental searching
set ignorecase                  " Searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Pasting
set clipboard=unnamed          " Enable OS clipboard to properly paste in to VIM buffer

"" History
set history=1000                " Remember last 1000 commands
set undolevels=1000             " Remember last 1000 undos
set wildignore=*.swp,*.swo,*.bak,*.class

"" Layout
syntax on
set t_Co=256
highlight Normal ctermbg=NONE ctermfg=NONE
highlight nonText ctermbg=NONE ctermfg=NONE
highlight htmlArg gui=italic
highlight htmlArg cterm=italic

set number
set ruler
set cursorline

let &colorcolumn="80,100"
let c_space_errors=1
set splitbelow
set splitright
set scrolloff=10

"" Settings
set virtualedit=all
set wildmenu
set wildmode=list:longest

set laststatus=2

let mapleader=","

runtime! config/**/*.vim
