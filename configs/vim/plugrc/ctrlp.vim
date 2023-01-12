" Use ag (the silver searcher) with ctrlp
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

Doc ; "CtrlP: Current buffers"
nnoremap <leader>; :CtrlPBuffer <CR>

Doc : "CtrlP: Lines in current buffers"
nnoremap <leader>: :CtrlPLine <CR>

Doc k "CtrlP: Files in current working directory"
nnoremap <leader>k :CtrlP <CR><CR>

Doc l "CtrlP: Files in directory of current file"
nnoremap <leader>l :CtrlP <C-R>=expand("%:p:h") . "/" <CR><CR>

Doc ar "CtrlP: Recently modified files"
nnoremap <leader>ar :CtrlPMRU <CR>

Doc vE "CtrlP: Files in .vim"
nnoremap <leader>vE :CtrlP ~/.vim/<CR>

let s:alphabet = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
      \ 'm', 'n', 'o', 'p', 'q', 'r',  's', 't', 'u', 'v', 'w', 'x',
      \ 'y', 'z' ]

function! g:StoreDir(letter)
  let l:dir = expand("%:p:h") . "/"
  execute "let @" . a:letter . " = \"" . l:dir . "\""
endfunction

function! g:RegDir(letter)
  execute ":CtrlP " . getreg(a:letter)
endfunction

for a in s:alphabet
  execute "nnoremap \\" . toupper(a) . " :call g:StoreDir('" . a . "')<CR><CR>"
  execute "nnoremap \\" . a . " :call g:RegDir('" . a . "')<CR><CR>"
endfor

let g:ctrlp_extensions = ['bindings']
