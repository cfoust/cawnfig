" Use ag (the silver searcher) with ctrlp
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

Doc ; "CtrlP: Current buffers"
nnoremap <leader>; :CtrlPBuffer <CR>

Doc : "CtrlP: Lines in current buffers"
nnoremap <leader>: :CtrlPLine <CR>

Doc l "CtrlP: Files in directory of current file"
nnoremap <leader>l :CtrlP <C-R>=expand("%:p:h") . "/" <CR><CR>

Doc k "CtrlP: Files in current working directory"
nnoremap <leader>k :CtrlP <CR><CR>

Doc ar "CtrlP: Recently modified files"
nnoremap <leader>ar :CtrlPMRU <CR>

Doc vE "CtrlP: Files in .vim"
nnoremap <leader>vE :CtrlP ~/.vim/<CR>

let g:ctrlp_extensions = ['bindings']
