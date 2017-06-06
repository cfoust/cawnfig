" Include the branches extension
let g:ctrlp_extensions = [
\ 'branches',
\ ]

" Fuzzy branch changer for git. 
nnoremap <leader>af :CtrlPBranches<CR>
