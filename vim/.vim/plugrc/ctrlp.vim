" Use ag (the silver searcher) with ctrlp
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Allow searching of current directory with ;p
nnoremap <leader>p :CtrlPBuffer <CR>
nnoremap <leader><leader>p :CtrlP <C-R>=expand("%:p:h") . "/" <CR><CR>
