" Caleb Foust's vimrc
" It does everything you want it to. Maybe too much.

" Sets the directory for swap files
set directory^=$HOME/.vim/tmp//

" 2 spaces master race
set tabstop=2 expandtab shiftwidth=2
set autoindent
set smartindent

" Fix backspacing to allow deleting past insert
set backspace=start

" We need our fancy shmancy ruler
set ruler

" Makes line endings and whitespace easier to see
set list

" Change the leader to semicolon
" WARNING: makes you a master programmer
let mapleader=";"

" Source file that includes all plugins from Vundle and their
" configuration.
source ~/.vim/plugins.vim

"""""""""""""""""""""""""""""""""""""""""""""""""
" Some handy commands for opening files

" Edit a file in the current file's directory in the current pane
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>

" Edit a file in the current file's directory in a new tab
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Just edit a file in a new tab
map t :tabe 

" Explore and choose a new file to edit
map <silent> ,T :Texplore <CR>

" Edit a file in the current file's directory in a new split
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""

" Some of this is taken from Stephen Sturdevant (sturdevant2@wisc.edu)
if has("autocmd")
   " When editing a file, always jump to the last cursor position
   autocmd BufReadPost * if line("'\"") | exe "normal '\"" | endif

   "In makefiles, don't expand tabs to spaces, since actual tabs are needed,
   "and set indentation at 8 chars to be sure that all indents are tabs:
   autocmd FileType make     set noexpandtab shiftwidth=8
   autocmd FileType automake set noexpandtab shiftwidth=8
   autocmd BufReadPost *.py  setlocal tabstop=4 shiftwidth=4
   autocmd BufNewFile,BufRead *.jlex set syntax=java
   autocmd BufNewFile,BufRead *.cup set syntax=java

   " Forces 8 space tabs to be consistent with gofmt
   autocmd BufReadPost *.go  setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
endif

" Remove all trailing whitespace with Shift-S
nnoremap <silent> <S-S> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Allows you to use Ctrl+H or Ctrl+L to navigate tabs
" Super useful if you have Capslock bound to Ctrl
nnoremap <C-H> :tabprevious<CR>
nnoremap <C-L> :tabnext<CR>

" Include a.vim, which lets us switch between header and source files
" easily
" :A switches to the header file corresponding to the current file being edited (or vise versa)
" :AS splits and switches
" :AV vertical splits and switches
" :AT new tab and switches
" :AN cycles through matches
" :IH switches to file under cursor
" :IHS splits and switches
" :IHV vertical splits and switches
" :IHT new tab and switches
" :IHN cycles through matches
" <Leader>ih switches to file under cursor
" <Leader>is switches to the alternate file of file under cursor (e.g. on  <foo.h> switches to foo.cpp)
" <Leader>ihn cycles through matches
source ~/.vim/a.vim

" Binding to jump to the current file's header or source file
nnoremap <C-T> :AT<CR>

" Include tabline.vim to define our custom tabline
" Similar to (https://github.com/mkitt/tabline.vim).
" I do not recall where I got this from.
source ~/.vim/tabline.vim

" Google's Python indenter.
source ~/.vim/google_python_style.vim

" This is like something a superhero named Code Hero would say.
syntax on

" HAHAHAHA I bet there's silly stuff in here
source ~/.vimprivate
