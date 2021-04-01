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

" Integration with simplenote.
Plug 'mrtazz/simplenote.vim'

" Lets you make codebase-wide changes after a grep.
Plug 'yegappan/greplace'
" Records what you do in projects (but not keystrokes).
Plug 'wakatime/vim-wakatime'
" Bridges the gap between terminal and GUI vim by setting the cursor properly.
Plug 'wincent/terminus'
" Cycle through color schemes.
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
" Minimal theme that uses your terminal's colors.
" I use this in conjunction with pywal.
Plug 'dylanaraps/wal.vim'
" For all of your syntax highlighting needs.
Plug 'sheerun/vim-polyglot'
" Lints better than a dryer.
Plug 'sbdchd/neoformat'

" Writing Plugs
""""""""""""""""""
" Plug for autowrapping writing
"Plug 'reedes/vim-pencil'

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
Plug 'neovimhaskell/haskell-vim'

" Initialize Plug plugins
call plug#end()
filetype plugin indent on

" Plugin-specific settings
""""""""""""""""""""""""""""
call Src('plugrc/ctrlp-bindings.vim')
call Src('plugrc/ctrlp-branches.vim')
call Src('plugrc/ctrlp-colorscheme.vim')
call Src('plugrc/ctrlp.vim')
call Src('plugrc/neoformat.vim')
call Src('plugrc/plug.vim')
call Src('plugrc/simplenote.vim')
"call Src('plugrc/syntastic.vim')
call Src('plugrc/tabular.vim')
call Src('plugrc/ultisnips.vim')
call Src('plugrc/vim-colorscheme-switcher.vim')
call Src('plugrc/vim-flow.vim')
call Src('plugrc/vim-fugitive.vim')
call Src('plugrc/vim-javascript.vim')
call Src('plugrc/vim-jsdoc.vim')
call Src('plugrc/youcompleteme.vim')

colorscheme base16-unikitty-dark
