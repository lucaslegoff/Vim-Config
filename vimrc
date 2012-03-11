"General
""""""""""""""""""""""

"disable compatibility with Vi (we use Vim here)
set nocompatible 

"set leader key to ,
let mapleader = ","

set encoding=utf-8

"Pathogen
""""""""""""""""""""""
filetype off

runtime bundle/pathogen/autoload/pathogen.vim

call pathogen#infect()
syntax on
filetype plugin indent on

"Formatting
""""""""""""""""""""""

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set autoindent
set showmode
set showcmd

"no annoying sound
set visualbell

"highlight current line
set cursorline

"draw things faster (help for terminal use)
set ttyfast

set ruler
"show line numbers relative to cursor
set relativenumber

"minimum number of lines around the cursor
set scrolloff=3

"completion on the command line
set wildmenu

"alway display the status line, no matter what
set laststatus=2

"set undofile

"Font
if has('gui_running')
    set guifont=DejaVu_Sans_Mono:h10:cANSI
endif

"Search
""""""""""""""""""""""
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"Visual
""""""""""""""""""""""
colorscheme chela_light

"Mappings
""""""""""""""""""""""

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nmap <leader>sv :so $MYVIMRC<CR>
