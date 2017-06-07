" Use ag (the silver searcher) with ctrlp
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Search through current buffers
" `Buffer` searches by buffer name
nnoremap <leader>; :CtrlPBuffer <CR>
" `Line` searches line by line in all buffers
nnoremap <leader>: :CtrlPLine <CR>

" Open files in directory of current file
nnoremap <leader>l :CtrlP <C-R>=expand("%:p:h") . "/" <CR><CR>
" Open files in cwd
nnoremap <leader>k :CtrlP <CR><CR>

" Search through recently opened files
nnoremap <leader>ar :CtrlPMRU <CR>

" Quick opening of files in .vim
nnoremap <leader>vE :CtrlP ~/.vim/<CR>

let g:ctrlp_extensions = ['bindings']
