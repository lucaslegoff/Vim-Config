"General 
"
""""""""""""""""""""""

if has('win32') || has ('win64')
    let $VIMHOME = "vimfiles"
else
    let $VIMHOME = ".vim"
endif

if has('win32')
    au GUIEnter * simalt ~n "x on an English Windows version. n on a French one
endif

"disable compatibility with Vi (we use Vim here)
set nocompatible 

"set leader key to ,
let mapleader = ","

set encoding=utf-8

"Pathogen
""""""""""""""""""""""
filetype off

set rtp+=~/$VIMHOME/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'surround.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'EasyMotion'
Bundle 'Gundo'
Bundle 'Syntastic'
Bundle 'Tagbar'
Bundle 'ZoomWin'
Bundle 'chela_light'
Bundle 'ctrlp.vim'
Bundle 'fugitive.vim'
Bundle 'matchit.zip'
Bundle 'SuperTab'
Bundle 'snipMate'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scala.vim'
Bundle 'csharp.vim'
Bundle 'osx_like'

syntax on
filetype plugin indent on

"set backupdir=~/.vim/_backup//    " where to put backup files.
"set directory=~/.vim/_temp//      " where to put swap files.


"Formatting
""""""""""""""""""""""

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"No line wraping difficult to read -> horizontal scroll
set nowrap
"visual vertical line at 85 characters
"set colorcolumn=85

set autoindent
set showmode
set showcmd

"no annoying sound
"set visualbell

"highlight current line
set cursorline

"draw things faster (help for terminal use)
set ttyfast

set ruler
"show line numbers relative to cursor
"set relativenumber
set nu

"minimum number of lines around the cursor
set scrolloff=3

"completion on the command line
set wildmenu

"alway display the status line, no matter what
set laststatus=2

"set undofile

"Font
if has('gui_running') && has('win32')
    set guifont=Consolas:h10:cANSI
else
    set guifont=Menlo:h12
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

"GUI
""""""""""""""""""""""
if has("gui_running")
  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif


"Mappings
""""""""""""""""""""""

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nmap <leader>sv :so $MYVIMRC<CR>

nnoremap <space> :

inoremap jj <esc>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

nmap <silent> <leader>/ :nohlsearch<CR>

nmap <CR> o<Esc>

"NerdTree
   map <c-e> :NERDTreeToggle<CR>:NERTreeMirror<CR>
   map <leader>n :NERDTreeFind<CR> 

"CtrP
    let g:ctrlp_max_depth = 10

if has('win32') || has ('win64')

    " Set options and add mapping such that Vim behaves a lot like MS-Windows
    "
    " Maintainer:	Bram Moolenaar <Bram@vim.org>
    " Last change:	2006 Apr 02

    " bail out if this isn't wanted (mrsvim.vim uses this).
    if exists("g:skip_loading_mswin") && g:skip_loading_mswin
      finish
    endif

    " set the 'cpoptions' to its Vim default
    if 1	" only do this when compiled with expression evaluation
      let s:save_cpo = &cpoptions
    endif
    set cpo&vim

    " set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
    behave mswin

    " backspace and cursor keys wrap to previous/next line
    set backspace=indent,eol,start whichwrap+=<,>,[,]

    " backspace in Visual mode deletes selection
    vnoremap <BS> d

    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    vnoremap <S-Del> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    map <C-V>		"+gP
    map <S-Insert>		"+gP

    cmap <C-V>		<C-R>+
    cmap <S-Insert>		<C-R>+

    " Pasting blockwise and linewise selections is not possible in Insert and
    " Visual mode without the +virtualedit feature.  They are pasted as if they
    " were characterwise instead.
    " Uses the paste.vim autoload script.

    exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

    imap <S-Insert>		<C-V>
    vmap <S-Insert>		<C-V>

    " Use CTRL-Q to do what CTRL-V used to do
    noremap <C-Q>		<C-V>

    " Use CTRL-S for saving, also in Insert mode
    noremap <C-S>		:update<CR>
    vnoremap <C-S>		<C-C>:update<CR>
    inoremap <C-S>		<C-O>:update<CR>

    " For CTRL-V to work autoselect must be off.
    " On Unix we have two selections, autoselect can be used.
    if !has("unix")
      set guioptions-=a
    endif

    " CTRL-Z is Undo; not in cmdline though
    noremap <C-Z> u
    inoremap <C-Z> <C-O>u

    " CTRL-Y is Redo (although not repeat); not in cmdline though
    noremap <C-Y> <C-R>
    inoremap <C-Y> <C-O><C-R>

    " Alt-Space is System menu
    if has("gui")
      noremap <M-Space> :simalt ~<CR>
      inoremap <M-Space> <C-O>:simalt ~<CR>
      cnoremap <M-Space> <C-C>:simalt ~<CR>
    endif

    " CTRL-A is Select all
    noremap <C-A> gggH<C-O>G
    inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
    cnoremap <C-A> <C-C>gggH<C-O>G
    onoremap <C-A> <C-C>gggH<C-O>G
    snoremap <C-A> <C-C>gggH<C-O>G
    xnoremap <C-A> <C-C>ggVG

    " CTRL-Tab is Next window
    noremap <C-Tab> <C-W>w
    inoremap <C-Tab> <C-O><C-W>w
    cnoremap <C-Tab> <C-C><C-W>w
    onoremap <C-Tab> <C-C><C-W>w

    " CTRL-F4 is Close window
    noremap <C-F4> <C-W>c
    inoremap <C-F4> <C-O><C-W>c
    cnoremap <C-F4> <C-C><C-W>c
    onoremap <C-F4> <C-C><C-W>c

    " restore 'cpoptions'
    set cpo&
    if 1
      let &cpoptions = s:save_cpo
      unlet s:save_cpo
    endif
endif    
