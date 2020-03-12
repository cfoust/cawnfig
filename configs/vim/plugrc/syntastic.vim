let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_eslint_exec = "./eslint"
let g:syntastic_python_checkers = []

Doc fe "Syntastic: Check ESlint"
nnoremap <leader>fe :SyntasticCheck eslint <CR>
