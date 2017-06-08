" docstring.vim
" =============
" Simple command for documenting <leader> bindings.

" Stores all bindings and their documentation in an array
" so that they can be accessed programmatically by my custom
" ctrlp plugin.
"
" This is not really useful for anyone else, for the time being.
"
" cfoust@sqweebloid.com

" The global list of bindings
" This is outside the load guard so that reloading .vimrc
" doesn't create duplicates in the list.
let g:docstring_bindings = []

" Load guard
if ( exists('g:loaded_docstring') && g:loaded_docstring )
  finish
endif
let g:loaded_docstring = 1

" Associate a leader binding with its description.
"
" Arguments:
"  a:bind   The characters that should be typed after hitting <leader>
"           to produce the desired action.
"
function Docstring(bind, ...)
  " Join the rest of the arguments together to make the description.
  " This is dirty A.F. but I barely know vimscript.
  let desc = join(a:000)
  let desc = strpart(desc, 1, len(desc) - 2)
  call add(g:docstring_bindings, a:bind . ' ' . desc)
endfunction

com! -nargs=* Doc :call Docstring(<f-args>)
