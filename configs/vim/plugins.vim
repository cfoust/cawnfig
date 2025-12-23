set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/addons')

" Global Plugs
""""""""""""""""""""""""""""
" Offers slick autocomplete functionality.
"Plug 'Valloric/YouCompleteMe'
" Gives easy keybindings for commenting and uncommenting things.
Plug 'scrooloose/nerdcommenter', { 'commit': 'a65465d' }
Plug 'SirVer/ultisnips'
" Snippets for ultisnips
Plug 'honza/vim-snippets', { 'commit': 'e081212' }
" All of the colors of the vimbow.
Plug 'flazz/vim-colorschemes', { 'commit': 'fd8f122' }
Plug 'chriskempson/base16-vim', { 'commit': '7959654' }
Plug 'sainnhe/everforest', { 'commit': '83b6664' }
" File opener with fuzzy search.
Plug 'ctrlpvim/ctrlp.vim', { 'commit': 'f68f4d0' }
Plug 'imkmf/ctrlp-branches', { 'commit': 'ef2cdbb' }
Plug 'hara/ctrlp-colorscheme', { 'commit': '13e6698' }
" Git integration.
Plug 'tpope/vim-fugitive', { 'commit': '2a53d79' }
Plug 'jjo/vim-cue', { 'commit': 'bd1a623' }
Plug 'kaarmu/typst.vim'
" Integration with simplenote.
Plug 'simplenote-vim/simplenote.vim', { 'commit': '3ad2292' }
" Lets you make codebase-wide changes after a grep.
Plug 'yegappan/greplace', { 'commit': '099d7a1' }
" Records what you do in projects (but not keystrokes).
Plug 'wakatime/vim-wakatime'
" Cycle through color schemes.
Plug 'xolox/vim-misc', { 'commit': '3e6b8fb' }
Plug 'xolox/vim-colorscheme-switcher', { 'commit': '4d9807a' }
" Minimal theme that uses your terminal's colors.
" I use this in conjunction with pywal.
Plug 'dylanaraps/wal.vim', { 'commit': 'c72ba0d' }
" For all of your syntax highlighting needs.
Plug 'sheerun/vim-polyglot', { 'commit': 'ce31cd1d' }
" Lints better than a dryer.
Plug 'sbdchd/neoformat', { 'commit': '3924dad' }
Plug 'earthly/earthly.vim', { 'commit': '18c3679' }
Plug 'neovimhaskell/haskell-vim', { 'commit': 'f35d022' }
"Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'dense-analysis/ale', { 'commit': '8eb4803' }

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
call Src('lang/janet/plugins.vim')
call Src('lang/js/plugins.vim')
call Src('lang/rust/plugins.vim')
call Src('lang/tex/plugins.vim')

" Initialize Plug plugins
call plug#end()
filetype plugin indent on

" Plugin-specific settings
""""""""""""""""""""""""""""
call Src('plugrc/ale.vim')
call Src('plugrc/ctrlp-bindings.vim')
call Src('plugrc/ctrlp-branches.vim')
call Src('plugrc/ctrlp-colorscheme.vim')
call Src('plugrc/ctrlp.vim')
call Src('plugrc/neoformat.vim')
call Src('plugrc/plug.vim')
call Src('plugrc/simplenote.vim')
call Src('plugrc/tabular.vim')
call Src('plugrc/ultisnips.vim')
call Src('plugrc/vim-colorscheme-switcher.vim')
call Src('plugrc/vim-fugitive.vim')
call Src('plugrc/vim-javascript.vim')
call Src('plugrc/vim-jsdoc.vim')
"call Src('plugrc/youcompleteme.vim')

" Color schemes
""""""""""""""""
let g:cawnfig_color_schemes = [
      \  'ztest',
      \  'testscheme2',
      \  'anotherdark',
      \  'arcadia',
      \  'breeze',
      \  'argonaut',
      \  'asu1dark',
      \  'base16-atelier-heath-light',
      \  'base16-greenscreen',
      \  'base16-gruvbox-dark-pale',
      \  'base16-mellow-purple',
      \  'base16-twilight',
      \  'birds-of-paradise',
      \  'bluechia',
      \  'bluish',
      \  'boltzmann',
      \  'brogrammer',
      \  'bw',
      \  'camo',
      \  'candycode',
      \  'duotone-darklake',
      \  'eva',
      \  'flattened_dark',
      \  'quantum',
      \  'sift',
      \  'vividchalk',
      \  'xoria256',
      \]

" We do have functionality for getting a random scheme from the entire pool,
" but this just does it from our list.
function! s:RandomNiceScheme()
      exec 'colorscheme ' . get(g:cawnfig_color_schemes, rand() % len(g:cawnfig_color_schemes))
      syntax on
endfunction

set background=dark
let g:everforest_background = 'hard'
function! InitializeColorScheme() abort
      if len($TMUX) > 0
            let current = trim(system('tmux show-option -gv @pcm:scheme'))
            if len(current) != 0
                  exec 'colorscheme ' . current
                  return
            endif
      endif

      colors brogrammer
endfunction

try
      call InitializeColorScheme()
catch /^Vim\%((\a\+)\)\=:E185/
endtry

Doc rr "Random nice color scheme"
nnoremap <leader>rr :call <sid>RandomNiceScheme()<cr>
nnoremap <leader>rc :RandomColorScheme<CR>

Doc rs "Record current color scheme in list"
nnoremap <leader>rs :call system('/Users/caleb/cawnfig/bin/add-colorscheme ' . shellescape(g:colors_name))<CR>:echo "Added '" . g:colors_name . "' to color schemes list"<CR>
