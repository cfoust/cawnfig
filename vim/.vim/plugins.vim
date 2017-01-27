set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of our plugins
"""""""""""""""""""""
" Offers slick autocomplete functionality.
Plugin 'Valloric/YouCompleteMe'
" Gives easy keybindings for commenting and uncommenting things.
Plugin 'scrooloose/nerdcommenter'
" Handy dandy snippet plugin.
Plugin 'SirVer/ultisnips'
" Snippets for ultisnips
Plugin 'honza/vim-snippets'
" All of the colors of the vimbow.
Plugin 'flazz/vim-colorschemes'
" Makes jumping around to words much faster.
Plugin 'easymotion/vim-easymotion'
" Handy file opener with fuzzy search.
Plugin 'kien/ctrlp.vim'
" Documentation generator for JavaScript.
Plugin 'heavenshell/vim-jsdoc'
" Beautiful plugin for golang integration.
Plugin 'fatih/vim-go'
" Git integration.
Plugin 'tpope/vim-fugitive'
" CoffeeScript syntax
Plugin 'kchmck/vim-coffee-script'

" Initialize Vundle plugins
call vundle#end()            " required
filetype plugin indent on    " required

" Use ag (the silver searcher) with ctrlp
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Map keybindings to <Leader>g for git.
""""""""""""""""""""""""""""""""""""""""
" <leader>gs does git status
nnoremap <leader>gs :Gstatus <CR>
" <leader>gc does git commit
nnoremap <leader>gc :Gcommit <CR>
set statusline+=%{fugitive#statusline()}

" eclim
""""""""""""""""""""""""""""""""""""""""
" Run the current java program
nnoremap <leader>jr :Java <CR>
" Comment the identifier under the cursor 
nnoremap <leader>jc :JavaDocComment <CR>
" Hook up Eclim to YCM
let g:EclimCompletionMethod = 'omnifunc'

" UltiSnips
""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["sniplets"]

" The best and only color scheme
colorscheme vividchalk

