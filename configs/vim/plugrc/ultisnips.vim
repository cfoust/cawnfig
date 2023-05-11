" UltiSnips
""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-s>"
"let g:UltiSnipsJumpForwardTrigger="<leader>un"
"let g:UltiSnipsJumpBackwardTrigger="<leader>up"
let g:UltiSnipsSnippetDirectories=["sniplets"]

inoremap <silent> <c-f> <c-c>:call g:UltiSnips#JumpForwards()<CR>
inoremap <silent> <c-d> <c-c>:call g:UltiSnips#JumpBackwards()<CR>
