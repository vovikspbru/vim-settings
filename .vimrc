syntax on
filetype plugin indent on

set backspace=2
:set hlsearch
:set nu
:colorscheme molokai
:set foldmethod=marker
:set expandtab
:retab
:set tabstop=4
:set shiftwidth=4

noremap   <Up>        <NOP>
noremap   <Down>      <NOP>
noremap   <Left>      <NOP>
noremap   <Right>     <NOP>

set nocompatible

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
