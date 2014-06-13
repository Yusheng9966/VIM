set nocompatible
set fencs=ucs-bom,utf8,gbk,cp936

"""""""""""""""""""""""����""""""""""""""""""""""""""
set shiftwidth=8
set tabstop=8
set expandtab
set autoindent

"""""""""""""""""""""""��ʾ""""""""""""""""""""""""""
set number

"""""""""""""""""""""""Search""""""""""""""""""""""""
set incsearch 
set ignorecase
set incsearch


"""""""""""""""""""""""filetype""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on
"""markdown�ļ�ʹ��utf8����
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}  set fenc=utf8 sw=4 ts=4 




"""""""""""""""""Vim�﷨""""""""""""""""""""""""""""""
"
"       �����ж�: == 
"       if <...>
"               
"       elseif <...>
"               
"       endif
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""Taglist""""""""""""""""""""""""""""""
"
"       ʹ��:TlistOpen��taglist����
"       ʹ��:TlistClose�ر�
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1

map <silent> <leader>tl :TlistToogle<cr>

"""""""""""""""""�Զ�����
iab sturct struct

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

