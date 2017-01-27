" eclim
""""""""""""""""""""""""""""""""""""""""
" Run the current java program
nnoremap <leader>jr :Java <CR>
" Comment the identifier under the cursor 
nnoremap <leader>jc :JavaDocComment <CR>
" Hook up Eclim to YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'
