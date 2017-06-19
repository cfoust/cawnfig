" Automatically enable vim-pencil when editing Markdown
" and commit messages.
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd
        \   call pencil#init({'wrap': 'hard', 'textwidth': 72})
        \ | setl spell spl=en_us fdl=4 noru nonu nornu
        \ | setl fdo+=search
augroup END
