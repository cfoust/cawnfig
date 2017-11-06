set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/addons')

" Global Plugs
""""""""""""""""""""""""""""
" Offers slick autocomplete functionality.
Plug 'Valloric/YouCompleteMe'
" Gives easy keybindings for commenting and uncommenting things.
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
" Snippets for ultisnips
Plug 'honza/vim-snippets'
" All of the colors of the vimbow.
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
" File opener with fuzzy search.
Plug 'ctrlpvim/ctrlp.vim'
Plug 'imkmf/ctrlp-branches'
Plug 'hara/ctrlp-colorscheme'
" Git integration.
Plug 'tpope/vim-fugitive'
" Nice-looking status line
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Integration with simplenote.
" This is life-changing.
Plug 'mrtazz/simplenote.vim'
" Lets you run commands in adjacent tmux panes.
Plug 'benmills/vimux'
" Highlights long lines.
" This isn't that hard to do manually, but this way
" we can toggle on and off.
Plug 'whatyouhide/vim-lengthmatters'
" Lets you make codebase-wide changes after a grep.
Plug 'yegappan/greplace'

" Use fzf for fuzzy finding instead of CtrlP.
" It's faster and a bit more easily extensible.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Writing Plugs
""""""""""""""""""
" Plug for autowrapping writing
Plug 'reedes/vim-pencil'
" Highlights the section you're working on.
Plug 'junegunn/limelight.vim'
" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Plugs I Wrote That Really Only I Can Use
" (PIWTROICU)
""""""""""""""""""""""""""""""""""""""""""""
" Creates command :CtrlPBindings, which lets me search
" through all of my <leader> bindings and their
" documentation.
set runtimepath^=$HOME/.vim/plugins/ctrlp-bindings

" Language-specific plugins
""""""""""""""""""""""""""""
call Src('lang/c/plugins.vim')
call Src('lang/js/plugins.vim')
call Src('lang/rust/plugins.vim')

" Pretty tmux status line that matches your vim-airline
" scheme.
Plug 'edkolev/tmuxline.vim'

" Initialize Plug plugins
call plug#end()
filetype plugin indent on

" Plugin-specific settings
""""""""""""""""""""""""""""
call Src('plugrc/airline.vim')
call Src('plugrc/ctrlp-branches.vim')
call Src('plugrc/ctrlp-bindings.vim')
call Src('plugrc/ctrlp-colorscheme.vim')
call Src('plugrc/ctrlp.vim')
call Src('plugrc/fzf.vim')
call Src('plugrc/goyo.vim')
call Src('plugrc/limelight.vim')
call Src('plugrc/simplenote.vim')
call Src('plugrc/tabular.vim')
call Src('plugrc/tmuxline.vim')
call Src('plugrc/ultisnips.vim')
call Src('plugrc/vim-fugitive.vim')
call Src('plugrc/vim-javascript.vim')
call Src('plugrc/vim-jsdoc.vim')
call Src('plugrc/vim-lengthmatters.vim')
call Src('plugrc/vim-pencil.vim')
call Src('plugrc/vimux.vim')
call Src('plugrc/plug.vim')
call Src('plugrc/youcompleteme.vim')

" cross-plugin settings
"""""""""""""""""""""""
"call Src('plugrc/writing.vim')

silent! colorscheme BlackSea
