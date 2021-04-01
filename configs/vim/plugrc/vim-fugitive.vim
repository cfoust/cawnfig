" Map keybindings to <Leader>g for git.
""""""""""""""""""""""""""""""""""""""""
Doc gs "Git: status"
nnoremap <leader>gs :Gstatus <CR>
Doc gc "Git: commit"
nnoremap <leader>gc :Gcommit <CR>
Doc gb "Git: show git blame for current file"
nnoremap <leader>gb :Gblame<CR>
Doc ga "Git: add all files"
nnoremap <leader>ga :!git add .<CR>
Doc gd "Git: show diff for current file"
nnoremap <leader>gd :Gdiff<CR>
Doc gp "Git: push HEAD to origin"
nnoremap <leader>gp :Git push origin HEAD<CR>
Doc gl "Git: previous versions of file in quickfix list"
nnoremap <leader>gl :0Gclog<CR>

Doc pr "GitHub: Make a pull request"
nnoremap <leader>pr :!hub pull-request -ocp <CR>

Doc br "GitHub: Open this line in GitHub for the current branch"
nnoremap <leader>bR :call system('hub browse -- blob/' . trim(system('git rev-parse --abbrev-ref HEAD')) . '/' . expand("%p") . '#L' . line('.')) <CR><CR>

Doc br "GitHub: Open this line in GitHub for the master branch"
nnoremap <leader>br :call system('hub browse -- blob/master/' . expand("%p") . '#L' . line('.')) <CR><CR>

set statusline+=%{fugitive#statusline()}

