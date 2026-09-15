set nocompatible

set encoding=utf-8

set showcmd                         " Display incomplete commands
set noshowmode                      " Don't show --INSERT-- etc. on the command line

set backspace=indent,eol,start      " Intuitive backspacing
set hidden                          " Handle multiple buffers better

set ignorecase                      " Case-insensitive searching
set smartcase                       " But case-sensitive if expression contains a capital letter

set number                          " Show line numbers
set relativenumber
set ruler                           " Show cursor position
set cursorline                      " Highlight the line of your cursor

set incsearch                       " Highlight matches as you type
set hlsearch                        " Highlight matches

set wrap                            " Turn on line wrapping
set linebreak                       " Break lines
set breakindent                     " Add indenting after break
let &showbreak="↳ "                 " Line break indicator

set scrolloff=5                     " Line scroll offset from top and bottom

set title                           " Set the terminal's title
set visualbell                      " No beeping

set noswapfile                      " Disable .swp file creation
set nobackup                        " Don't make a backup before overwriting a file
set nowritebackup                   " And again

set history=1000                    " Remember last 1000 commands
set undolevels=1000                 " Remember last 1000 undos

set tabstop=4                       " Global tab width
set softtabstop=4                   " And again, related
set shiftwidth=4                    " And again, related
set shiftround
set smartindent
set expandtab                       " Use spaces instead of tabs

set clipboard=unnamed               " Enable OS clipboard to properly paste in to VIM buffer

set splitbelow                      " Open vsplits to below
set splitright                      " Open hsplits to the right

" Configure syntax highlighting
" Reduce syntax highlighting so it doesn't hang while trying to highlight everything
syntax on

if has('termguicolors')
    set termguicolors               " Use the colorscheme's true colors instead of the terminal's 16/256 palette
endif

function! SyncColorschemeWithMacOS()
    let l:style = system('defaults read -g AppleInterfaceStyle 2>/dev/null')
    execute 'colorscheme ' . (l:style =~? 'dark' ? 'habamax' : 'shine')
endfunction

call SyncColorschemeWithMacOS()
autocmd FocusGained * call SyncColorschemeWithMacOS()

syntax sync minlines=2000
syntax sync maxlines=5000
set synmaxcol=400
set redrawtime=4000
