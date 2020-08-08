" Uses prettier inside Docker.
let g:neoformat_javascript_docker = {
      \ 'exe': './lint',
      \ 'args': ['--stdin', '--stdin-filepath', '%:p'],
      \ 'stdin': 1,
      \ }

let g:neoformat_enabled_javascript = ['prettier', 'docker']

" Uses black inside docker.
let g:neoformat_python_docker = {
      \ 'exe': './lint',
      \ 'args': ['-', '2>/dev/null'],
      \ 'stdin': 1,
      \ }

let g:neoformat_enabled_python = ['docker']
let g:neoformat_enabled_haskell = ['brittany']

Doc tl "Neoformat: Lint current file"
map <leader>tl :Neoformat <CR>
