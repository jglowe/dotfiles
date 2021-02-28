"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                           o8o
"                           `"'
"              oooo    ooo oooo  ooo. .oo.  .oo.   oooo d8b  .ooooo.
"               `88.  .8'  `888  `888P"Y88bP"Y88b  `888""8P d88' `"Y8
"                `88..8'    888   888   888   888   888     888
"          .o.    `888'     888   888   888   888   888     888   .o8
"          Y8P     `8'     o888o o888o o888o o888o d888b    `Y8bod8P'
"
" Jonathan Lowe
" github username : https://github.com/jglowe
"
" Non plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vint global ignores
" vint: -ProhibitSetNoCompatible

" Brings vim into this century/decade
set nocompatible

set nomodeline

" turn absolute line numbers on
set number relativenumber

" Enables file undo after files close
set undofile
set undodir=~/.vim/undodir

" Makes backspace to behave like most text editors
set backspace=indent,eol,start

" Search settings
set incsearch
set hlsearch

" Colors column 81 background to show the line limit
set colorcolumn=81

" Sets the path to include the files in this subdirectory
set path+=**

let mapleader = ' '

" Pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Sets the update time to be more responsive
set updatetime=100

" Deals with tab sillyness for default settings
set expandtab
set tabstop=4
set shiftwidth=4

if !has('nvim')
  set ttymouse=xterm2
endif

set mouse=a

set nopaste
set pastetoggle=<F2>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmd groups
"
" These are the non plugin related autocmd groups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END

augroup indendation
  autocmd!
augroup END

augroup cpp
  autocmd!
augroup END

" Changes tab settings for specific languages
autocmd indendation Filetype sh set expandtab&
autocmd indendation Filetype ocaml,ruby,vim setlocal expandtab
                                                   \ tabstop=2
                                                   \ shiftwidth=2

" Enables spell checking for text files
autocmd indendation Filetype markdown,text set spell |
                             \ highlight clear SpellBad |
                             \ highlight SpellBad cterm=underline,bold

autocmd indendation Filetype markdown setlocal textwidth=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" sets the wildmenu for tab completion
set wildmenu

" Removes searching through all the included files from CTRL-N completion
" which can signifintly slow down autocompletion`
set complete-=i

" Sets autocomplete tab to only complete common characters for the first tab.
" By default it autocompletes to the first item in the list, which you can tab
" through.
if !has('nvim')
  set completeopt=longest,menuone,popup
else
  set completeopt=longest,menuone
endif

function! Smart_TabComplete()
  let line = getline('.')                     " current line

  let substr = strpart(line, -1, col('.')+1)  " from the start of the current
                                              " line to one character right
                                              " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")   " word till cursor
  if (strlen(substr)==0)                      " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1  " position of period, if any
  let has_slash = match(substr, '\/') != -1   " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                     " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                     " file matching
  else
    return "\<C-X>\<C-O>"                     " plugin matching
  endif
endfunction

" Turns tab when in a word to autocomplete
function! Tab_Or_Complete()
  if &filetype ==# 'ocaml'
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~# '^\(\w\|\.\)'
      return pumvisible() ? "\<C-o>" : "\<C-x>\<C-o>"
    else
      return "\<Tab>"
    endif
  endif
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~# '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

" Makes shift tab go backward through autocomplete
function! Shift_Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~# '^\w'
    return "\<C-p>"
  else
    return "\<Tab>"
  endif
endfunction

" Tab will now autocomplete if there is leading chars
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
inoremap <S-Tab> <C-R>=Shift_Tab_Or_Complete()<CR>

" Makes enter act as autocomplete select if an item is selected.
" By default it acts like enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Folding code defaults
set foldmethod=syntax

autocmd cpp Filetype cpp set foldmethod=indent

function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf('%10s', lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Utility functions and commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make ctags
command! MakeTags !ctags -R .

" Make json readable in buffer
noremap <leader>j :%!python -m json.tool<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"     ooooooooo.   oooo                          o8o
"     `888   `Y88. `888                          `"'
"      888   .d88'  888  oooo  oooo   .oooooooo oooo  ooo. .oo.    .oooo.o
"      888ooo88P'   888  `888  `888  888' `88b  `888  `888P"Y88b  d88(  "8
"      888          888   888   888  888   888   888   888   888  `"Y88b.
"      888          888   888   888  `88bod8P'   888   888   888  o.  )88b
"     o888o        o888o  `V88V"V8P' `8oooooo.  o888o o888o o888o 8""888P'
"                                   d"     YD
"                                   "Y88888P'
"
" Plugin loading and settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &loadplugins

if has('packages')
  " Vim8 has native support for package loading.
  "
  " These are packages that don't have any settings
  packadd! vim-gitgutter
  packadd! vim-eunuch
  packadd! vim-fugitive
  packadd! vim-trailing-whitespace

  " if has('nvim')
  "   packadd! nvim-lspconfig
  " endif
  packadd! salt-vim

  " packadd! vim-gutentags
  " packadd! poppy.vim
  packadd! rust.vim
  " packadd! vim-reason-plus
else
  call plug#begin('~/.vim/plugged')

  Plug 'itchyny/lightline.vim'           " The nice bar below
  Plug 'itchyny/vim-gitbranch'           " Adds git info to bar below
  Plug 'mark-westerhof/vim-lightline-base16'
  if v:version < 800
    Plug 'vim-syntastic/syntastic'       " Syntax Checker
  else
    Plug 'w0rp/ale'                      " Async linter Need to install linter though
    Plug 'maximbaz/lightline-ale'        " Adds ale info to bar below
  endif
  Plug 'airblade/vim-gitgutter'          " Shows changes in vim for git
  Plug 'tpope/vim-eunuch'                " Adds commands like mkdir to vim
  Plug 'tpope/vim-fugitive'              " git integration
  Plug 'scrooloose/nerdtree'             " Adds filetree to left
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'bronson/vim-trailing-whitespace' " Highlites trailing space in red
  Plug 'majutsushi/tagbar'               " Code Structure on right
  Plug 'reasonml-editor/vim-reason-plus'
  Plug 'chriskempson/base16-vim'
  Plug 'edkolev/tmuxline.vim'
  Plug 'terryma/vim-smooth-scroll'       " Makes scrolling smooth
  Plug 'LucHermitte/lh-vim-lib'          " See below
  Plug 'LucHermitte/local_vimrc'         " project local vimrc
  Plug 'ludovicchabant/vim-gutentags'    " Manages tags
  Plug 'christoomey/vim-tmux-navigator'  " Tmux Integration
  Plug 'ericcurtin/CurtineIncSw.vim'     " Navigate between .ccp and .h files
  Plug 'bounceme/poppy.vim'              " Highlight parentheses
  Plug 'rgrinberg/vim-ocaml'
  Plug 'tpope/vim-commentary'
  Plug 'rust-lang/rust.vim'
  Plug 'segeljakt/vim-silicon'

  call plug#end()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('packages')
  packadd! base16-vim
endif

let base16colorspace=256

colorscheme base16-classic-dark

if has('termguicolors')
  set termguicolors
endif

function! SetColorscheme(name)
  let l:name = a:name
  execute 'colorscheme ' . l:name
  let l:name = substitute(l:name, '-', '_', 'g')
  let g:lightline.colorscheme = l:name
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfun

command Light call SetColorscheme('base16-classic-light')
command Dark call SetColorscheme('base16-classic-dark')

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('packages')
  packadd! lightline.vim
  packadd! vim-gitbranch
  packadd! vim-lightline-base16
endif

" Shows cool status bar
set laststatus=2
set noshowmode

let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }

let g:lightline.colorscheme = 'base16_classic_dark'

" Ale lightline settings
if v:version >= 800
  let g:lightline.component_expand = {
        \  'linter_checking': 'lightline#ale#checking',
        \  'linter_warnings': 'lightline#ale#warnings',
        \  'linter_errors': 'lightline#ale#errors',
        \  'linter_ok': 'lightline#ale#ok',
        \ }

  let g:lightline.component_type = {
        \  'linter_checking': 'left',
        \  'linter_warnings': 'warning',
        \  'linter_errors': 'error',
        \  'linter_ok': 'left',
        \ }

  let g:lightline.active.right = [
        \  [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
		\  [ 'percent' ],
		\  [ 'fileformat', 'fileencoding', 'filetype' ],
        \  [ 'lineinfo' ]
        \ ]
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-startify settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vint: -ProhibitUnnecessaryDoubleQuote

if has('packages')
  packadd! vim-startify
endif

let g:startify_custom_header = [
      \ "    oooooo     oooo  o8o                          .ooooo.         .o ",
      \ "     `888.     .8'   `\"'                         d88'   `8.     o888 ",
      \ "      `888.   .8'   oooo  ooo. .oo.  .oo.        Y88..  .8'      888 ",
      \ "       `888. .8'    `888  `888P\"Y88bP\"Y88b        `88888b.       888 ",
      \ "        `888.8'      888   888   888   888       .8'  ``88b      888 ",
      \ "         `888'       888   888   888   888       `8.   .88P .o.  888 ",
      \ "          `8'       o888o o888o o888o o888o       `boood8'  Y8P o888o",
      \ ]
      " \ "    oooooo     oooo  o8o                    ",
      " \ "     `888.     .8'   `\"'                    ",
      " \ "      `888.   .8'   oooo  ooo. .oo.  .oo.   ",
      " \ "       `888. .8'    `888  `888P\"Y88bP\"Y88b  ",
      " \ "        `888.8'      888   888   888   888  ",
      " \ "         `888'       888   888   888   888  ",
      " \ "          `8'       o888o o888o o888o o888o ",

" vint: +ProhibitUnnecessaryDoubleQuote

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentary settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('packages')
  packadd! vim-commentary
endif

autocmd cpp FileType cpp setlocal commentstring=//%s
noremap <leader>/ :Commentary<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-tmux-navigator settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('packages')
  packadd! vim-tmux-navigator
endif

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" local_vimrc settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if has('packages')
"   packadd! lh-vim-lib
"   packadd! local_vimrc
" endif

" let g:local_vimrc = ['.config', '_vimrc_local.vim']
" call lh#local_vimrc#munge('whitelist', $HOME.'/git')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-silicon settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if has('packages')
"   packadd! vim-silicon
" endi

" let g:silicon = {
"       \ 'theme':              'Dracula',
"       \ 'font':                  'Hack',
"       \ 'background':         '#aaaaff',
"       \ 'shadow-color':       '#555555',
"       \ 'line-pad':                   2,
"       \ 'pad-horiz':                  0,
"       \ 'pad-vert':                   0,
"       \ 'shadow-blur-radius':         0,
"       \ 'shadow-offset-x':            0,
"       \ 'shadow-offset-y':            0,
"       \ 'line-number':           v:true,
"       \ 'round-corner':          v:true,
"       \ 'window-controls':       v:true,
"       \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmuxline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('packages')
  packadd! tmuxline.vim
endif

" Generate current theme by :Tmuxline lightline_insert
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \   'a'    : '#S',
      \   'b'    : '#W',
      \   'c'    : ['#(whoami)', '#H'],
      \   'win'  : '#I #W',
      \   'cwin' : '#I #W',
      \   'x'    : '%a',
      \   'y'    : '#W %R',
      \   'z'    : '#H'
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CurtineIncSw cpp-h file navigator settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('packages')
  packadd! CurtineIncSw.vim
endif

map <F5> :call CurtineIncSw()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTREE settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('packages')
  packadd! nerdtree
  packadd! nerdtree-git-plugin
endif

augroup NERDTree
  autocmd!
augroup END

" Show hidden files in nerdtree
let NERDTreeShowHidden=1

" autocmd NERDTree vimenter * NERDTree " Open by default
" autocmd NERDTree StdinReadPre * let s:std_in=1 " Open if no file is specified
" autocmd NERDTree VimEnter * if argc() == 0 &&
"                                \ !exists("s:std_in") | NERDTree | endif

" autocmd NERDTree StdinReadPre * let s:std_in=1 " Open on directory
" autocmd NERDTree VimEnter * if argc() == 1 &&
"                              \ isdirectory(argv()[0]) &&
"                              \ !exists("s:std_in")
"                              \   | exe 'NERDTree' argv()[0]
"                              \   | wincmd p | ene | endif

" Close vim if left window is nerdtree
autocmd NERDTree bufenter * if (winnr("$") == 1 &&
                              \ exists("b:NERDTree") &&
                              \ b:NERDTree.isTabTree())
                              \   | q | endif

" arrow keys
" CTL+n is now nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:version >= 800
  if has('packages')
    packadd! ale
    packadd! lightline-ale
  endif

  " if has('nvim')
  "   lua require'nvim_lsp'.rust_analyzer.setup{}
  " endif
  "let g:ale_set_highlights = 0
  let g:airline#extensions#ale#enabled = 1
  let g:ale_linters = {'rust': ['analyzer']}

  highlight ALEError ctermbg=none cterm=underline
  highlight ALEWarning ctermbg=none cterm=underline

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAGBAR settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('packages')
  packadd! tagbar
endif

nmap <S-t> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:version < 800

  let g:syntastic_python_checkers = ['pylint']

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-smooth-scroll settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('packages')
  packadd! vim-smooth-scroll
endif

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-ocaml settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('packages')
  packadd! vim-ocaml
endif

let g:ocaml_folding=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ocaml merlin and other plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('opam')
  let s:opamshare = substitute(system('opam config var share'),
                               \ '[\r\n]*$',
                               \ '',
                               \ '')

  execute 'set rtp+=' . s:opamshare . '/ocp-indent/vim,'
                    \ . s:opamshare . '/ocp-index/vim,'
                    \ . s:opamshare . '/merlin/vim'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Endif for &loadplugins
"
" End of plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
endif

" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
"
" Must come *after* the `:packadd!` calls above otherwise the contents of
" package "ftdetect" directories won't be evaluated.
filetype indent plugin on
syntax on
