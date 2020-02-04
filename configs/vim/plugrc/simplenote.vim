" Set up a nice binding that opens up all
" notes that have been modified within the
" past ten days.

let g:org_agenda_files=['~/org/index.org']

function SimplenoteRecents()
  " This is messy as hell but I don't know vimscript so I can't make it
  " cleaner.
  "
  " Essentially, we don't want to grab all of the notes we've ever made,
  " but just the ones we've modified recently. simplenote.vim doesn't do
  " any caching. This sets the 'since' to be N days before today.
  "
  " We need the substitute because SimplenoteList fails when your date
  " ends in a newline.
  call simplenote#SimplenoteList(substitute(system('date +\%F -d "-10 day"'), '\n\+$', '', ''))
endfunction
nnoremap <leader>io :call SimplenoteRecents() <CR>
command SNR :call SimplenoteRecents() <CR>
command SNN :call simplenote#SimplenoteNew()

function OpenTodo()
  call simplenote#SimplenoteOpen('ddaba340676c2f85f1d2bc9b1d6ffaa6')
endfunction

nnoremap <leader>td :call OpenTodo()
