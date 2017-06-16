" Since we only use this plugin for goyo.vim (which hides vim's status
" bar) we don't want to enable it by default. Goyo's hooks will enable
" it when we enter distraction-free mode.
let g:lengthmatters_on_by_default = 0

" Toggle long line highlighting
Doc tk "LengthMatters: Toggle long line highlighting"
nnoremap <silent> <leader>tk :LengthmattersToggle <CR>
