" Automatically load on startup (doesn't by default)
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Allow toggling with <leader>hm
nnoremap <leader>hm <Esc>:call ToggleHardMode()<CR>
