" find files and populate the quickfix list
"
" This is different from plugins like CtrlP because sometimes
" I want to put all files matching a name pattern into a quick 
" fix list for modification.
"
" Taken from:
" http://vim.wikia.com/wiki/Searching_for_files
fun! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfun
command! -nargs=1 FindFile call FindFiles(<q-args>)
