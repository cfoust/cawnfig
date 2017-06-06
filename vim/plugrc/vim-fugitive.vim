" Map keybindings to <Leader>g for git.
""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gs :Gstatus <CR>
nnoremap <leader>gc :Gcommit <CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gp :Gpush origin HEAD<CR>
" Using Gmerge puts conflicts in the quickfix list.
" This means you can use :cn to go to the next problem.
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>grm :Gremove<CR>

" Stash manipulation commands
nnoremap <leader>gS :Git stash<CR>
nnoremap <leader>gL :Git stash list<CR>
nnoremap <leader>gP :Git stash pop<CR>

set statusline+=%{fugitive#statusline()}

