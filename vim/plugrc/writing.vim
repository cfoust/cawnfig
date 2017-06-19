" Define the :WriteMode command which sets up vim to be nice for writing
" longer documents.
function! EnterWriteMode()
  " Goyo mode centers the buffer in the screen
  Goyo
  Limelight
  SoftPencil
endfunction

command! WriteMode call EnterWriteMode()
