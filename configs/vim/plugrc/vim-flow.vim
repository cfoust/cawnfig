let g:flow#flowpath = "./flow"
let g:flow#autoclose = 1
let g:flow#errjmp = 1
let g:flow#omnifunc = 0

Doc ft "Flow: Show type"
nnoremap <leader>ft :FlowType <CR>
