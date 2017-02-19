" Use ag (the silver searcher) with ctrlp
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Search through current buffers with ;i
nnoremap <leader>i :CtrlPBuffer <CR>

" Open files in directory of current file
nnoremap <leader>p :CtrlP <C-R>=expand("%:p:h") . "/" <CR><CR>

" Quick opening of files in .vim
nnoremap <leader>R :CtrlP ~/.vim/<CR>
