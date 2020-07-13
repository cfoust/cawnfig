" Documentation generator for JavaScript.
Plug 'heavenshell/vim-jsdoc'
" Nice JS integration
Plug 'pangloss/vim-javascript'
" Alignment of colons or equals
Plug 'godlygeek/tabular'

" Automatic formatting
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \ 'for': ['javascript', 'typescript'] }

Plug 'flowtype/vim-flow', {
      \ 'for': ['javascript', 'typescript'] }
