" Enables only Flow for JavaScript. See :ALEInfo for a list of other available
" linters. NOTE: the `flow` linter uses an old API; prefer `flow-language-server`.
let b:ale_linters = ['flow-language-server']

" Or in ~/.vim/vimrc:
let g:ale_linters = {
\   'javascript': ['flow-language-server'],
\   'typescript': ['tsserver'],
\   'typescriptreact': ['tsserver'],
\}

" Flow error output
" https://flukus.github.io/vim-errorformat-demystified.html
"Error ---------------------------------------------------------------------------- flow-typed/npm/jest_v23.x.x.js:950:18\n\nCannot resolve name `JestDoneFn`. [cannot-resolve-name]\n\n   950|      fn?: (done: JestDoneFn) => ?Promise<mixed>,\n                         ^^^^^^^^^^\n\n
set errorformat^=Error\ %.%#\ %f:%l:%c%m

autocmd FileType javascript setlocal makeprg=node_modules/.bin/flow\ --show-all-errors\ --one-line

set errorformat^=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m
autocmd FileType typescript setlocal makeprg=node_modules/.bin/tsc\ -p\ .\ --noEmit\ --jsx\ react
autocmd FileType typescriptreact setlocal makeprg=node_modules/.bin/tsc\ -p\ .\ --noEmit\ --jsx\ react

Doc fm "Flow: Check types"
nnoremap <leader>fm :make <CR>

Doc fd "Flow: Jump to definition"
nnoremap <leader>fd :ALEGoToDefinition <CR>

Doc fr "Flow: Show all references to identifier"
nnoremap <leader>fr :ALEFindReferences <CR>

Doc fd "ALE: Show details for identifiers"
nnoremap <leader>ft :ALEDetail <CR>

nnoremap [e :ALEPreviousWrap <CR>
nnoremap ]e :ALENextWrap <CR>
