" BUNDLE
" Automatically download vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Configure vim-plug
call plug#begin('~/.vim/bundle')
    
    Plug 'w0rp/ale'
    Plug 'sheerun/vim-polyglot'
    Plug 'cohama/lexima.vim'
    Plug 'vim-airline/vim-airline'

call plug#end()

set title

set ttyfast

set mouse=a
set ve=all
set vb

set nu 
set relativenumber

set nobackup
set nowritebackup
set noswapfile

set nowrap

syntax on

set hlsearch
set incsearch

set ai
set smartindent
filetype plugin indent on
set expandtab
set backspace=2
set tabstop=2
" set softtabstop=2
set shiftwidth=2

set hidden

set antialias

set encoding=utf-8

nnoremap <c-s> :w<cr>
nnoremap <c-d> :q<cr>