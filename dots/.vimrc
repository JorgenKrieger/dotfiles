set nocompatible

"" Plugins
call plug#begin('~/.vim/plugged')

" Themes
Plug 'dikiaap/minimalist'
Plug 'vim-airline/vim-airline-themes'

" Navigation
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim', { 'on' : 'Ack' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTree'] }

" Languages
Plug 'othree/html5.vim', { 'for': ['html', 'eruby'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-haml', { 'for': ['haml', 'sass', 'scss'] }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" Misc
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'

call plug#end()

syntax enable
colorscheme minimalist
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
