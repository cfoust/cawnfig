let g:flow#flowpath = "./flow"
let g:flow#autoclose = 1
let g:flow#enable = 0
let g:flow#errjmp = 1
let g:flow#omnifunc = 0

Doc ft "Flow: Show type under cursor"
nnoremap <leader>ft :FlowType <CR>

Doc fm "Flow: Check types"
nnoremap <leader>fm :FlowMake <CR>

Doc fd "Flow: Jump to definition"
nnoremap <leader>fd :FlowJumpToDef <CR>
