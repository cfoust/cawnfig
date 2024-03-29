let g:VimuxRunnerType = 'window'
let g:VimuxUseNearestPane = 0

" Sends the path of the current file to akitatest, a wrapper around
" a JavaScript test suite.
Doc fj "Vimux: Run Mocha on current file in tmux window"
map <leader>fj :call VimuxRunCommand('akitatest ' . expand('%:p')) <CR>

Doc fa "Vimux: Run most recent command in tmux window"
map <leader>fa :call VimuxRunLastCommand() <CR>

Doc fc "Vimux: Send SIGTERM to command running in tmux window"
map <leader>fc :call VimuxInterruptRunner() <CR>

" Run a command stored in a register.
Doc ff "Vimux: Run a command from a register"
map <leader>ff :execute "call VimuxRunCommand(@" . nr2char(getchar()) . ")" <CR>

" Open a new tmux window in the directory of the current file.
if exists('$TMUX')
  Doc fn "Vimux: New window in directory of current file"
  nnoremap <leader>fn :call system("tmux new-window\\; send-keys 'cd " . expand("%:p:h") . "' Enter C-l") <CR>
endif
