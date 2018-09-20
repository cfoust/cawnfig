" We want to use @return instead of @returns.
let g:jsdoc_tags = {
      \   'returns':   'return',
      \   'function':  'function',
      \   'param':     'param',
      \   'class':     'class'
      \ }

" Allow for es6 shorthand functions
let g:jsdoc_enable_es6 = 1

Doc mjsc "JS: Generate JsDoc comment"
nnoremap <leader>mjsc :JsDoc<CR>
