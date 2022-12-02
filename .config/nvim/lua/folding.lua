--------------------------------------------------------------------------------
--
--                 __      _     _ _               _
--                / _|    | |   | (_)             | |
--               | |_ ___ | | __| |_ _ __   __ _  | |_   _  __ _
--               |  _/ _ \| |/ _` | | '_ \ / _` | | | | | |/ _` |
--               | || (_) | | (_| | | | | | (_| |_| | |_| | (_| |
--               |_| \___/|_|\__,_|_|_| |_|\__, (_)_|\__,_|\__,_|
--                                          __/ |
--                                         |___/
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains all the folding settings
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
