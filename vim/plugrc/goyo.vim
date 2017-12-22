" Toggles distraction-free code writing.
Doc tg "Goyo: Toggle distraction free editing"
nnoremap <leader>tg :Goyo<CR>

" Goyo allows you to define these hooks that
" are called when you enter distraction-free mode.
function! s:goyo_enter()
  " If tmux is running, hide the status bar and
  " restore it when goyo quits.
  "if exists('$TMUX')
    "silent !tmux set status off
  "endif

  " Hide line end characters
  set nolist

  " Color lines based on their indent level
  RainbowLevelsOn

  " Highlight long lines
  LengthmattersEnable

  " Add a little red "+" when we've made edits to the file
  setlocal statusline=%M
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  "if exists('$TMUX')
    "silent !tmux set status on
  "endif

  set list

  " Color lines based on their indent level
  RainbowLevelsOff

  LengthmattersDisable
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
