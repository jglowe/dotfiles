--------------------------------------------------------------------------------
--
--                     _                      _
--                    | |                    | |
--                    | |__   __ _ ___  ___  | |_   _  __ _
--                    | '_ \ / _` / __|/ _ \ | | | | |/ _` |
--                    | |_) | (_| \__ \  __/_| | |_| | (_| |
--                    |_.__/ \__,_|___/\___(_)_|\__,_|\__,_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains all the baseline settings that don't require plugins
--------------------------------------------------------------------------------

-- turn absolute line numbers on
vim.opt.number = true
-- vim.opt.relativenumber = true

-- Enables file undo after files close
vim.opt.undofile = true
vim.opt.undodir = vim.env.HOME .. "/.config/nvim/undodir"

-- Sets up the dir for swap files under neovim config
vim.opt.dir = vim.env.HOME .. "/.config/nvim/swap"

-- Makes backspace to behave like most text editors
vim.opt.backspace = "indent,eol,start"

-- Search settings
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Sets the path to include the files in this subdirectory
vim.opt.path = vim.opt.path + "**"

vim.g.mapleader = " "

-- Pane navigation
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", {noremap = true})
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", {noremap = true})
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", {noremap = true})
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", {noremap = true})

-- Sets the update time to be more responsive
vim.opt.updatetime = 100

vim.opt.mouse = "a"

vim.opt.paste = false
vim.opt.pastetoggle = "<F2>"
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"

vim.opt.list = true
vim.opt.listchars = "tab:>>"

-- Deals with tab sillyness for default settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

--------------------------------------------------------------------------------
-- Indentation settings
--------------------------------------------------------------------------------
local indentation_group = vim.api.nvim_create_augroup("indentation",
                                                      {clear = true})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"sh"},
    command = "set expandtab&",
    group = indentation_group
})

-- Changes tab settings for specific languages
vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"ocaml", "ruby", "vim", "crystal", "tex"},
    command = "setlocal expandtab tabstop=2 shiftwidth=2",
    group = indentation_group
})

-- Enables spell checking for text files
vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"markdown", "text", "tex"},
    command = "set spell spelllang=en_us | highlight clear SpellBad | highlight SpellBad cterm=underline,bold",
    group = indentation_group
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"markdown"},
    command = "setlocal textwidth=80",
    group = indentation_group
})

--------------------------------------------------------------------------------
-- Folding settings
--------------------------------------------------------------------------------
vim.opt.viewdir = vim.env.HOME .. "/.config/nvim/view"

local save_folds_group = vim.api.nvim_create_augroup("AutoSaveFolds",
                                                     {clear = true})

vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = {"*"},
    command = "silent! mkview",
    group = save_folds_group
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = {"*"},
    command = "silent! loadview",
    group = save_folds_group
})

-- Folding code defaults
vim.opt.foldmethod = "syntax"
