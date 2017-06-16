" =============================================================================
" File:          autoload/ctrlp/bindings.vim
" Description:   Example extension for ctrlp.vim
" =============================================================================

" Load guard
if ( exists('g:loaded_ctrlp_bindings') && g:loaded_ctrlp_bindings )
  \ || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_bindings = 1

" Add this extension's settings to g:ctrlp_ext_vars
"
call add(g:ctrlp_ext_vars, {
  \ 'init': 'ctrlp#bindings#init()',
  \ 'accept': 'ctrlp#bindings#accept',
  \ 'lname': 'bindings',
  \ 'sname': 'bd',
  \ 'type': 'line',
  \ 'enter': 'ctrlp#bindings#enter()',
  \ 'exit': 'ctrlp#bindings#exit()',
  \ 'opts': 'ctrlp#bindings#opts()',
  \ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#bindings#init()
  cal ctrlp#hicheck('CtrlPBinding', 'Todo')
  sy match CtrlPBinding '>\s\[\s[A-z;:,.]\+\s\+\]'

  " Change the array of bindings and their documentation
  " into strings searchable by CtrlP.
  let transformed = []
  for binding in g:docstring_bindings
    let keys = binding[0]
    let description = binding[1]

    " Pad the keybinding
    while len(keys) < 5
      let keys = keys . ' '
    endwhile

    call add(transformed, '[ ' . keys . '] ' . description)
  endfor

  return transformed
endfunction

" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#bindings#accept(mode, str)
  " Extract the binding from the string returned by CtrlP.
  " Unfortunately CtrlP doesn't let you assign arbitrary data to
  " an entry; you have to parse the string even though you just
  " generated it.
  " I guess it wasn't made for applications like this.
  let innerRegex = '\[\s\([A-z;:,.]\+\)\s\+\]'
  let binding = matchlist(a:str, innerRegex)[1]
  call ctrlp#exit()

  " The underscore after the normal here is something else, I tell you.
  " It turns out that :normal will put a "." before your command if it
  " starts with "1 ", the recommended way of "escaping" a space. This
  " only occurs if you have <Space> as your leader.
  exec "normal _" . get(g:,"mapleader","\\") . binding
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#bindings#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#bindings#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#bindings#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#bindings#id()
  return s:id
endfunction
