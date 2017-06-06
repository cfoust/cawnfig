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
" Handy file opener with fuzzy search.
Plugin 'kien/ctrlp.vim'
Bundle 'imkmf/ctrlp-branches'
Bundle 'hara/ctrlp-colorscheme'
" Git integration.
Plugin 'tpope/vim-fugitive'
" Nice-looking status line
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Integration with simplenote.
" This is life-changing.
Plugin 'mrtazz/simplenote.vim'
" Lets you run commands in adjacent tmux panes.
Plugin 'benmills/vimux'
" Adds the `a` text object for manipulating function
" arguments.
Plugin 'gaving/vim-textobj-argument'
" Handy plugin for highlighting long lines.
" This isn't that hard to do manually, but this way
" we can toggle on and off.
Plugin 'whatyouhide/vim-lengthmatters'
Plugin 'vim-scripts/sokoban.vim'

" Writing plugins
""""""""""""""""""
" Plugin for autowrapping writing
Plugin 'reedes/vim-pencil'
" Highlights the section you're working on.
Plugin 'junegunn/limelight.vim'
" Distraction-free writing
Plugin 'junegunn/goyo.vim'

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
call Src('plugrc/airline.vim')
call Src('plugrc/ctrlp-branches.vim')
call Src('plugrc/ctrlp-colorscheme.vim')
call Src('plugrc/ctrlp.vim')
call Src('plugrc/goyo.vim')
call Src('plugrc/limelight.vim')
call Src('plugrc/simplenote.vim')
call Src('plugrc/ultisnips.vim')
call Src('plugrc/vim-fugitive.vim')
call Src('plugrc/vim-javascript.vim')
call Src('plugrc/vim-jsdoc.vim')
call Src('plugrc/vim-lengthmatters.vim')
call Src('plugrc/vimux.vim')
call Src('plugrc/vundle.vim')
call Src('plugrc/youcompleteme.vim')

silent! colorscheme vividchalk
