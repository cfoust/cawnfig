" Map keybindings to <Leader>g for git.
""""""""""""""""""""""""""""""""""""""""
" <leader>gs does git status
nnoremap <leader>gs :Gstatus <CR>
" <leader>gc does git commit
nnoremap <leader>gc :Gcommit <CR>
set statusline+=%{fugitive#statusline()}

