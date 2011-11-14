"General
""""""""""""""""""""""

"disable compatibility with Vi (we use Vim here)
set nocompatible 

"set leader key to ,
let mapleader = ","

"Pathogen
""""""""""""""""""""""

runtime bundle/pathogen/autoload/pathogen.vim

call pathogen#infect()
