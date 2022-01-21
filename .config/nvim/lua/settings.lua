--------------------------------------------------------------------------------
--
--                       _   _   _                   _
--                      | | | | (_)                 | |
--              ___  ___| |_| |_ _ _ __   __ _ ___  | |_   _  __ _
--             / __|/ _ \ __| __| | '_ \ / _` / __| | | | | |/ _` |
--             \__ \  __/ |_| |_| | | | | (_| \__ \_| | |_| | (_| |
--             |___/\___|\__|\__|_|_| |_|\__, |___(_)_|\__,_|\__,_|
--                                        __/ |
--                                       |___/
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains the non plugin settings that aren't associated with
-- another logical unit of my config
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
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", {noremap = true})

-- Sets the update time to be more responsive
vim.opt.updatetime = 100

vim.opt.mouse = "a"

vim.opt.paste = false
vim.opt.pastetoggle = "<F2>"
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"

vim.opt.list = true
vim.opt.listchars = "tab:>>"
