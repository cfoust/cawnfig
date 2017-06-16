" Toggle concealing with <leader>jst
Doc tjs "JS: Toggle concealing of keywords"
nnoremap <leader>tjs :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" This is kind of cool, taken from this plugin's
" github page
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"

" This is so tryhard but I love it.
" Since you can only use one 'character' we're kind
" of limited. Japanese works but Russian doesn't.

" Use kanji with somewhat related Japanese meanings
"let g:javascript_conceal_function             = "作"
"let g:javascript_conceal_null                 = "無"
"let g:javascript_conceal_this                 = "此"
"let g:javascript_conceal_return               = "帰"
"let g:javascript_conceal_undefined            = "定"

" Make JavaScript Russian-ish
"let g:javascript_conceal_function             = "функция"
"let g:javascript_conceal_null                 = "нуль"
"let g:javascript_conceal_this                 = "это"
"let g:javascript_conceal_return               = "вернет"
"let g:javascript_conceal_undefined            = "неопред."
"let g:javascript_conceal_NaN                  = "ЭнЧ"
"let g:javascript_conceal_prototype            = "прототип"
"let g:javascript_conceal_static               = "статический"
"let g:javascript_conceal_super                = "супер"
