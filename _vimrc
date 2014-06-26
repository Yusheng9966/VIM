set nocompatible
set fencs=ucs-bom,utf8,gbk,cp936

"""""""""""""""""""""""缩进""""""""""""""""""""""""""
set shiftwidth=8
set tabstop=8
set expandtab
set autoindent

"""""""""""""""""""""""显示""""""""""""""""""""""""""
set number

"""""""""""""""""""""""Search""""""""""""""""""""""""
set incsearch 
set ignorecase
set incsearch


"""""""""""""""""""""""filetype""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on

"""markdown文件使用utf8编码
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}  set fenc=utf8 sw=4 ts=4 


"将光标在窗口的底和顶移动
function MoveCursorToTopBottm()
    let s:cur_line=line(".")
    let s:top_line = line("w0")
    let s:bottom_line = line("w$")
    if s:cur_line != s:bottom_line 
        exe "normal" (s:bottom_line - s:cur_line)."j"
    else
        exe "normal" (s:cur_line-s:top_line)."k"
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"       将光标从其他窗口移动到Taglist窗口
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
function MoveCursorToTaglist()
        let s:_cur_winnr = winnr()
        let s:winnum =  bufwinnr(g:TagList_title)
        if s:_cur_winnr == s:winnum 
                exe s:_last_winnr . 'wincmd w'
        else
                exe s:winnum . 'wincmd w'
                let s:_last_winnr = s:_cur_winnr
        endif
endfunction
        
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"       设置脚本目录
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:scriptpath = $HOME . "/.vim"
if has('win32')
        let s:scriptpath = $VIM
endif

function MyRun()
    exe "w"
    if &filetype == "markdown"
            if has('win32')
                    exe  'sil !start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe %'
            else
                    exe "!open -a /Applications/Google\\ Chrome.app %"
            endif
    endif
    if &filetype == "c" || &filetype == "cpp"
        exe '!python '.s:scriptpath.'\\pycompile.py m:\\src\\xcgMTCGPro2010.sln Debug x64 '
    endif
endfunction



"""""""""""""""""Taglist""""""""""""""""""""""""""""""
"
"       使用:TlistOpen打开taglist窗口
"       使用:TlistClose关闭
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 1


""""""""""""""""""键映射""""""""""""""""""""""""""""""
map <silent> <leader>tl :TlistToggle<cr>
map <silent> <F7> :call MoveCursorToTaglist()<cr>       "从TagList窗口来回切换

"将选中行注释和取消注释
if has('win32')
        vmap <buffer> <leader>kc :!python \%VIM\%\\pycoment.py<cr>
        vmap <buffer> <leader>ku :!python \%VIM\%\\pycoment.py 2<cr>
else
        vmap <buffer> <leader>kc :!python $HOME/.vim/pycoment.py<cr>
        vmap <buffer> <leader>ku :!python $HOME/.vim/pycoment.py 2<cr>
endif

"将光标移动到窗口顶部和底部
nmap <space> :call MoveCursorToTopBottm()<cr>
nmap <leader>rr :call MyRun()<cr>
map <M-o> :A<cr>
map <M-O> :A<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""自动更正
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


" =========
" 图形界面
" =========
if has('gui_running')
        " 字体配置
        exec 'set guifont='.'Consolas:h9:cANSI'
endif
