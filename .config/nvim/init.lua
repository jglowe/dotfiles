--------------------------------------------------------------------------------
--
--                           o8o
--                           `"'
--              oooo    ooo oooo  ooo. .oo.  .oo.   oooo d8b  .ooooo.
--               `88.  .8'  `888  `888P"Y88bP"Y88b  `888""8P d88' `"Y8
--                `88..8'    888   888   888   888   888     888
--          .o.    `888'     888   888   888   888   888     888   .o8
--          Y8P     `8'     o888o o888o o888o o888o d888b    `Y8bod8P'
--
-- Jonathan Lowe
-- github username : https://github.com/jglowe
--
-- Non plugin settings
--------------------------------------------------------------------------------

-- turn absolute line numbers on
vim.o.number = true
vim.o.relativenumber = true

-- Enables file undo after files close
vim.o.undofile = true
vim.o.undodir = "~/.config/nvim/undodir"

-- Makes backspace to behave like most text editors
vim.o.backspace = "indent,eol,start"

-- Search settings
vim.o.incsearch = true
vim.o.hlsearch = true

-- Colors column 81 background to show the line limit
vim.o.colorcolumn = "81"

-- Sets the path to include the files in this subdirectory
vim.o.path = vim.o.path .. "**"

vim.g.mapleader = ' '

-- Pane navigation
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", {})
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", {})
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", {})
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", {})

-- Sets the update time to be more responsive
vim.o.updatetime = 100

-- Deals with tab sillyness for default settings
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.mouse = "a"

vim.o.paste = false
vim.o.pastetoggle = "<F2>"

--------------------------------------------------------------------------------
-- Autocmd groups
--
-- These are the non plugin related autocmd groups
--------------------------------------------------------------------------------

vim.cmd([[augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END]])

vim.cmd([[augroup indendation
  autocmd!
augroup END]])

vim.cmd([[augroup cpp
  autocmd!
augroup END]])

-- Changes tab settings for specific languages
vim.cmd("autocmd indendation Filetype sh set expandtab&")
vim.cmd([[autocmd indendation Filetype ocaml,ruby,vim setlocal expandtab
                                                             \ tabstop=2
                                                             \ shiftwidth=2]])

-- Enables spell checking for text files
vim.cmd([[autocmd indendation Filetype markdown,text set spell |
                                     \ highlight clear SpellBad |
                                     \ highlight SpellBad cterm=underline,bold]])

vim.cmd("autocmd indendation Filetype markdown setlocal textwidth=80")

--------------------------------------------------------------------------------
-- Autocompletion settings
--------------------------------------------------------------------------------

-- sets the wildmenu for tab completion
vim.o.wildmenu = true

-- Removes searching through all the included files from CTRL-N completion
-- which can signifintly slow down autocompletion`
vim.o.complete = ".,w,b,u,t"

-- Sets autocomplete tab to only complete common characters for the first tab.
-- By default it autocompletes to the first item in the list, which you can tab
-- through.
vim.o.completeopt = "menuone,preview"

vim.cmd([[function! Smart_TabComplete()
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
endfunction]])

-- Turns tab when in a word to autocomplete
vim.cmd([[function! Tab_Or_Complete()
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
endfunction]])

-- Makes shift tab go backward through autocomplete
vim.cmd([[function! Shift_Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~# '^\w'
    return "\<C-p>"
  else
    return "\<Tab>"
  endif
endfunction]])

-- Tab will now autocomplete if there is leading chars
vim.api.nvim_set_keymap("i", "<TAB>", "<C-R>=Tab_Or_Complete()<CR>", {})
vim.api.nvim_set_keymap("i", "<S-TAB>", "<C-R>=Shift_Tab_Or_Complete()<CR>", {})

-- Makes enter act as autocomplete select if an item is selected.
-- By default it acts like enter
vim.cmd([[inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]])

--------------------------------------------------------------------------------
-- Folding settings
--------------------------------------------------------------------------------

-- " Folding code defaults
-- set foldmethod=syntax

-- autocmd cpp Filetype cpp set foldmethod=indent

-- function! NeatFoldText() "{{{2
--   let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
--   let lines_count = v:foldend - v:foldstart + 1
--   let lines_count_text = '| ' . printf('%10s', lines_count . ' lines') . ' |'
--   let foldchar = matchstr(&fillchars, 'fold:\zs.')
--   let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
--   let foldtextend = lines_count_text . repeat(foldchar, 8)
--   let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
--   return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
-- endfunction
-- set foldtext=NeatFoldText()
-- " }}}2

--------------------------------------------------------------------------------
-- " Utility functions and commands
--------------------------------------------------------------------------------

-- " Make ctags
-- command! MakeTags !ctags -R .

-- " Make json readable in buffer
-- noremap <leader>j :%!python -m json.tool<CR>

--------------------------------------------------------------------------------
--
--     ooooooooo.   oooo                          o8o
--     `888   `Y88. `888                          `"'
--      888   .d88'  888  oooo  oooo   .oooooooo oooo  ooo. .oo.    .oooo.o
--      888ooo88P'   888  `888  `888  888' `88b  `888  `888P"Y88b  d88(  "8
--      888          888   888   888  888   888   888   888   888  `"Y88b.
--      888          888   888   888  `88bod8P'   888   888   888  o.  )88b
--     o888o        o888o  `V88V"V8P' `8oooooo.  o888o o888o o888o 8""888P'
--                                   d"     YD
--                                   "Y88888P'
--
-- Plugin loading and settings
--------------------------------------------------------------------------------

if vim.o.loadplugins then



vim.cmd("packadd! vim-gitgutter")
vim.cmd("packadd! vim-eunuch")
vim.cmd("packadd! vim-fugitive")
vim.cmd("packadd! vim-trailing-whitespace")
vim.cmd("packadd! nvim-lspconfig")
vim.cmd("packadd! nvim-lspconfig")
vim.cmd("packadd! salt-vim")
vim.cmd("packadd! rust.vim")
vim.cmd("packadd! vim-crystal")
-- vim.cmd("packadd! vim-gutentags")
-- vim.cmd("packadd! poppy.vim")
-- vim.cmd("packadd! vim-reason-plus")

--------------------------------------------------------------------------------
-- color scheme settings
--------------------------------------------------------------------------------

vim.cmd("packadd! base16-vim")

vim.g.base16colorspace=256

vim.cmd("colorscheme base16-classic-dark")

vim.o.termguicolors = true
--
-- function! SetColorscheme(name)
--   let l:name = a:name
--   execute 'colorscheme ' . l:name
--   let l:name = substitute(l:name, '-', '_', 'g')
--   let g:lightline.colorscheme = l:name
--   call lightline#init()
--   call lightline#colorscheme()
--   call lightline#update()
-- endfun

-- command Light call SetColorscheme('base16-classic-light')
-- command Dark call SetColorscheme('base16-classic-dark')

-- hi! Normal ctermbg=NONE guibg=NONE
-- hi! NonText ctermbg=NONE guibg=NONE

--------------------------------------------------------------------------------
-- Lightline settings
--------------------------------------------------------------------------------

vim.cmd("packadd! lightline.vim")
vim.cmd("packadd! vim-gitbranch")
vim.cmd("packadd! vim-lightline-base16")

-- Shows cool status bar
vim.o.laststatus = 2
vim.o.showmode = false

vim.g.lightline = {
  ['active'] = {
    ['left'] = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } }
  },
  ['component_function'] = {
    ['gitbranch'] = 'gitbranch#name'
  },
  ['colorscheme'] = "base16_classic_dark"
}

-- Lua can't update global values internals like you would expect
--
-- https://github.com/neovim/neovim/issues/12544
--
-- vim.g.lightline["colorscheme"] = 'base16_classic_dark'

-- So what is below won't work
vim.g.lightline.component_expand = {
  ['linter_checking'] = 'lightline#ale#checking',
  ['linter_warnings'] = 'lightline#ale#warnings',
  ['linter_errors'] = 'lightline#ale#errors',
  ['linter_ok'] = 'lightline#ale#ok',
}

vim.g.lightline.component_type = {
  ['linter_checking'] = 'left',
  ['linter_warnings'] = 'warning',
  ['linter_errors'] = 'error',
  ['linter_ok'] = 'left',
}

vim.g.lightline.active.right = {
  { 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' },
  { 'percent' },
  { 'fileformat', 'fileencoding', 'filetype' },
  { 'lineinfo' }
}

--------------------------------------------------------------------------------
-- vim-startify settings
--------------------------------------------------------------------------------

vim.cmd("packadd! vim-startify")

vim.g.startify_custom_header = {
"    oooooo     oooo  o8o                    ",
"     `888.     .8'   `\"'                    ",
"      `888.   .8'   oooo  ooo. .oo.  .oo.   ",
"       `888. .8'    `888  `888P\"Y88bP\"Y88b  ",
"        `888.8'      888   888   888   888  ",
"         `888'       888   888   888   888  ",
"          `8'       o888o o888o o888o o888o "
}

--------------------------------------------------------------------------------
-- vim-commentary settings
--------------------------------------------------------------------------------

vim.cmd("packadd! vim-commentary")

-- autocmd cpp FileType cpp setlocal commentstring=//%s
vim.api.nvim_set_keymap("", "<leader>/", ":Commentary<CR>", {})

--------------------------------------------------------------------------------
-- vim-tmux-navigator settings
--------------------------------------------------------------------------------

vim.cmd("packadd! vim-tmux-navigator")

vim.g.tmux_navigator_no_mappings = 1

vim.api.nvim_set_keymap("n", "<C-H>", ":TmuxNavigateLeft<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-J>", ":TmuxNavigateDown<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-K>", ":TmuxNavigateUp<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-L>", ":TmuxNavigateRight<cr>", { silent = true })

--------------------------------------------------------------------------------
-- local_vimrc settings
--------------------------------------------------------------------------------

-- "   packadd! lh-vim-lib
-- "   packadd! local_vimrc

-- " let g:local_vimrc = ['.config', '_vimrc_local.vim']
-- " call lh#local_vimrc#munge('whitelist', $HOME.'/git')

--------------------------------------------------------------------------------
-- " vim-silicon settings
--------------------------------------------------------------------------------

-- " if has('packages')
-- "   packadd! vim-silicon
-- " endi

-- " let g:silicon = {
-- "       \ 'theme':              'Dracula',
-- "       \ 'font':                  'Hack',
-- "       \ 'background':         '#aaaaff',
-- "       \ 'shadow-color':       '#555555',
-- "       \ 'line-pad':                   2,
-- "       \ 'pad-horiz':                  0,
-- "       \ 'pad-vert':                   0,
-- "       \ 'shadow-blur-radius':         0,
-- "       \ 'shadow-offset-x':            0,
-- "       \ 'shadow-offset-y':            0,
-- "       \ 'line-number':           v:true,
-- "       \ 'round-corner':          v:true,
-- "       \ 'window-controls':       v:true,
-- "       \ }

--------------------------------------------------------------------------------
-- tmuxline settings
--------------------------------------------------------------------------------

vim.cmd("packadd! tmuxline.vim")

-- Generate current theme by :Tmuxline lightline_insert
vim.g.tmuxline_powerline_separators = 0
vim.g.tmuxline_preset = {
  ['a']    = '#S',
  ['b']    = '#W',
  ['c']    = {'#(whoami)', '#H'},
  ['win']  = '#I #W',
  ['cwin'] = '#I #W',
  ['x']    = '%a',
  ['y']    = '#W %R',
  ['z']    = '#H'
}

--------------------------------------------------------------------------------
-- CurtineIncSw cpp-h file navigator settings
--------------------------------------------------------------------------------

vim.cmd("packadd! CurtineIncSw.vim")

vim.api.nvim_set_keymap("", "<F5>", ":call CurtineIncSw()<CR>", {})

--------------------------------------------------------------------------------
-- NERDTREE settings
--------------------------------------------------------------------------------

vim.cmd("packadd! nerdtree")
vim.cmd("packadd! nerdtree-git-plugin")

vim.cmd([[augroup NERDTree
  autocmd!
augroup END
]])

-- Show hidden files in nerdtree
vim.g.NERDTreeShowHidden = 1

-- " autocmd NERDTree vimenter * NERDTree " Open by default
-- " autocmd NERDTree StdinReadPre * let s:std_in=1 " Open if no file is specified
-- " autocmd NERDTree VimEnter * if argc() == 0 &&
-- "                                \ !exists("s:std_in") | NERDTree | endif
--
-- " autocmd NERDTree StdinReadPre * let s:std_in=1 " Open on directory
-- " autocmd NERDTree VimEnter * if argc() == 1 &&
-- "                              \ isdirectory(argv()[0]) &&
-- "                              \ !exists("s:std_in")
-- "                              \   | exe 'NERDTree' argv()[0]
-- "                              \   | wincmd p | ene | endif

-- Close vim if left window is nerdtree
vim.cmd([[autocmd NERDTree bufenter * if (winnr("$") == 1 &&
                                    \ exists("b:NERDTree") &&
                                    \ b:NERDTree.isTabTree())
                                    \   | q | endif]])

-- arrow keys
-- CTL+n is now nerdtree toggle

vim.api.nvim_set_keymap("", "<C-n>", ":NERDTreeToggle<CR>", {})

--------------------------------------------------------------------------------
-- Ale settings
--------------------------------------------------------------------------------

vim.cmd("packadd! ale")
vim.cmd("packadd! lightline-ale")

--   " if has('nvim')
--   "   lua require'nvim_lsp'.rust_analyzer.setup{}
--   " endif
--   "let g:ale_set_highlights = 0
vim.g.ale_linters = {['rust']= {'analyzer'}}

vim.cmd("highlight ALEError ctermbg=none cterm=underline")
vim.cmd("highlight ALEWarning ctermbg=none cterm=underline")

--------------------------------------------------------------------------------
-- TAGBAR settings
--------------------------------------------------------------------------------

vim.cmd("packadd! tagbar")

vim.api.nvim_set_keymap("n", "<S-t>", ":TagbarToggle<CR>", {})

--------------------------------------------------------------------------------
-- vim-smooth-scroll settings
--------------------------------------------------------------------------------

vim.cmd("packadd! vim-smooth-scroll")

vim.api.nvim_set_keymap("n", "<c-u>", ":call smooth_scroll#up(&scroll, 10, 2)<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-d>", ":call smooth_scroll#down(&scroll, 10, 2)<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-b>", ":call smooth_scroll#up(&scroll*2, 20, 4)<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-f>", ":call smooth_scroll#down(&scroll*2, 20, 4)<CR>", { silent = true })

--------------------------------------------------------------------------------
-- vim-ocaml settings
--------------------------------------------------------------------------------

vim.cmd("packadd! vim-ocaml")

vim.g.ocaml_folding = 1

--------------------------------------------------------------------------------
-- ocaml merlin and other plugin settings
--------------------------------------------------------------------------------

if vim.fn.executable('opam') then
    local opamshare = vim.fn.substitute(vim.fn.system('opam var share'), '[\r\n]*$', '', '')

    vim.fn.execute('set rtp+=' .. opamshare .. '/ocp-indent/vim,'
                               .. opamshare .. '/ocp-index/vim,'
                               .. opamshare .. '/merlin/vim')
end

--------------------------------------------------------------------------------
-- Endif for loadplugins
--
-- End of plugin settings
--------------------------------------------------------------------------------

end

-- Automatic, language-dependent indentation, syntax coloring and other
-- functionality.
--
-- Must come *after* the `:packadd!` calls above otherwise the contents of
-- package "ftdetect" directories won't be evaluated.
vim.cmd("filetype indent plugin on")
vim.o.syntax = "on"
