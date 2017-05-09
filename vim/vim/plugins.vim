set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of our global plugins
""""""""""""""""""""""""""""
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
Plugin 'chriskempson/base16-vim'
" Makes jumping around to words much faster.
Plugin 'easymotion/vim-easymotion'
" Handy file opener with fuzzy search.
Plugin 'kien/ctrlp.vim'
" Git integration.
Plugin 'tpope/vim-fugitive'
" Nice-looking status line
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin for autowrapping writing
Plugin 'reedes/vim-pencil'
" Makes vim harder to use. For good.
Plugin 'Two-Finger/hardmode'

" Language-specific plugins
""""""""""""""""""""""""""""
call Src('lang/c/plugins.vim')
call Src('lang/js/plugins.vim')
call Src('lang/go/plugins.vim')
call Src('lang/html/plugins.vim')
call Src('lang/rust/plugins.vim')

" Initialize Vundle plugins
call vundle#end()            " required
filetype plugin indent on    " required

" plugin-specific settings
""""""""""""""""""""""""""""
call Src('plugrc/ctrlp.vim')
call Src('plugrc/vim-fugitive.vim')
call Src('plugrc/vim-javascript.vim')
call Src('plugrc/vim-jsdoc.vim')
call Src('plugrc/eclim.vim')
call Src('plugrc/easymotion.vim')
call Src('plugrc/ultisnips.vim')
call Src('plugrc/airline.vim')
call Src('plugrc/youcompleteme.vim')
call Src('plugrc/hardmode.vim')

" The best and only color scheme
" colorscheme vividchalk
colorscheme blackboard
