" Toggles centered writing
Doc tg "Goyo: Toggle distraction free editing"
nnoremap <leader>tg :Goyo<CR>

" Goyo allows you to define these hooks that
" are called when you enter distraction-free mode.
" If tmux is running, hide the status bar and
" restore it when goyo quits.
function! s:goyo_enter()
  "if exists('$TMUX')
    "silent !tmux set status off
  "endif
  set nolist
  LengthmattersEnable
  setlocal statusline=%M
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  "if exists('$TMUX')
    "silent !tmux set status on
  "endif
  set list
  LengthmattersDisable
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
