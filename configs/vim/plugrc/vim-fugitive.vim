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
nnoremap <leader>gp :Gpush origin HEAD<CR>
Doc gl "Git: previous versions of file in quickfix list"
nnoremap <leader>gl :Glog<CR>
Doc grm "Git: delete the file and stage the deletion"
nnoremap <leader>grm :Gremove<CR>

Doc pr "GitHub: Make a pull request"
nnoremap <leader>pr :!hub pull-request -ocp <CR>

" Stash manipulation commands
Doc gS "Git: stash staged changes"
nnoremap <leader>gS :Git stash<CR>
Doc gL "Git: list stashes"
nnoremap <leader>gL :Git stash list<CR>
Doc gP "Git: pop the most recent stash"
nnoremap <leader>gP :Git stash pop<CR>

set statusline+=%{fugitive#statusline()}

