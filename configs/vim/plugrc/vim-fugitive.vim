" Map keybindings to <Leader>g for git.
""""""""""""""""""""""""""""""""""""""""
Doc gs "Git: status"
nnoremap <leader>gs :Git <CR>
Doc gc "Git: commit"
nnoremap <leader>gc :Git commit <CR>
Doc gb "Git: show git blame for current file"
nnoremap <leader>gb :Git blame<CR>
Doc ga "Git: add all files"
nnoremap <leader>ga :!git add .<CR>
Doc gd "Git: show diff for current file versus HEAD"
nnoremap <leader>gd :Gvdiffsplit!<CR>
Doc gd "Git: show diff for staged changes versus HEAD"
nnoremap <leader>gD :Git diff HEAD<CR>
Doc gd "Git: show diff for current file versus master"
nnoremap <leader>gm :Gvdiffsplit! origin/main<CR>
Doc gp "Git: push HEAD to origin"
nnoremap <leader>gp :Git push origin HEAD<CR>
Doc gl "Git: previous versions of file in quickfix list"
nnoremap <leader>gl :0Gclog<CR>

Doc pr "GitHub: Make a pull request"
nnoremap <leader>pr :!gh pr create<CR>

Doc br "GitHub: Open this line in GitHub for the current branch"
nnoremap <leader>bR :call system('gh browse -- blob/' . trim(system('git rev-parse --abbrev-ref HEAD')) . '/' . expand("%p") . '#L' . line('.')) <CR><CR>

Doc br "GitHub: Open this line in GitHub for the main branch"
nnoremap <leader>br :call system('gh browse ' . expand("%p") . ':' . line('.')) <CR><CR>

set statusline+=%{fugitive#statusline()}

