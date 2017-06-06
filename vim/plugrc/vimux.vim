let g:VimuxRunnerType = 'window'
" Sends the path of the current file to akitatest, a wrapper around
" a JavaScript test suite.
map <leader>fj :call VimuxRunCommand('akitatest ' . expand('%:p')) <CR>
map <leader>fa :call VimuxRunLastCommand() <CR>
map <leader>fc :call VimuxInterruptRunner() <CR>

" Run a command stored in a register.
map <leader>ff :execute "call VimuxRunCommand(@" . nr2char(getchar()) . ")" <CR>
