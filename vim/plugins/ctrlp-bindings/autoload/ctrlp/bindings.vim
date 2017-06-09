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
" Required:
"
" + init: the name of the input function including the brackets and any
"         arguments
"
" + accept: the name of the action function (only the name)
"
" + lname & sname: the long and short names to use for the statusline
"
" + type: the matching type
"   - line : match full line
"   - path : match full line like a file or a directory path
"   - tabs : match until first tab character
"   - tabe : match until last tab character
"
" Optional:
"
" + enter: the name of the function to be called before starting ctrlp
"
" + exit: the name of the function to be called after closing ctrlp
"
" + opts: the name of the option handling function called when initialize
"
" + sort: disable sorting (enabled by default when omitted)
"
" + specinput: enable special inputs '..' and '@cd' (disabled by default)
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
  \ 'sort': 0,
  \ 'specinput': 0,
  \ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#bindings#init()
  cal ctrlp#hicheck('CtrlPBinding', 'Todo')
  sy match CtrlPBinding '> [A-Za-z]\+'
  return g:docstring_bindings
endfunction

" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#bindings#accept(mode, str)
  let binding = split(a:str)[0]
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
