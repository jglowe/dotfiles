--------------------------------------------------------------------------------
--
--                                                            _
--                                                           | |
--      __ _ _ __  _ __   ___  __ _ _ __ ___ _ __   ___ ___  | |_   _  __ _
--     / _` | '_ \| '_ \ / _ \/ _` | '__/ _ \ '_ \ / __/ _ \ | | | | |/ _` |
--    | (_| | |_) | |_) |  __/ (_| | | |  __/ | | | (_|  __/_| | |_| | (_| |
--     \__,_| .__/| .__/ \___|\__,_|_|  \___|_| |_|\___\___(_)_|\__,_|\__,_|
--          | |   | |
--          |_|   |_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains the color scheme, statusline, and all appearence related
-- code
--------------------------------------------------------------------------------

local plugin = require("plugin")

plugin.load("base16-vim")
plugin.load("lightline.vim")
plugin.load("vim-gitbranch")
plugin.load("vim-lightline-base16")

vim.g.base16colorspace = 256
vim.opt.termguicolors = true

vim.cmd("colorscheme base16-classic-dark")

-- If the color scheme changes, you will have to find these in the color scheme
-- to update the EndOfBuffer Colors
--
-- vim.cmd('highlight EndOfBuffer ctermbg=g:base16_cterm01
--                              \ guibg=g:base16_gui01')
vim.cmd("highlight EndOfBuffer ctermbg=18 guibg=#202020")

-- Shows cool status bar
vim.opt.laststatus = 2
vim.opt.showmode = false

vim.g.lightline = {
    ["active"] = {
        ["left"] = {
            {"mode", "paste"}, {"gitbranch", "readonly", "filename", "modified"}
        }
    },
    ["component_function"] = {["gitbranch"] = "gitbranch#name"},
    ["colorscheme"] = "base16_classic_dark"
}

-- Lua can't update global values internals like you would expect
--
-- https://github.com/neovim/neovim/issues/12544
--
-- vim.g.lightline["colorscheme"] = 'base16_classic_dark'

-- So what is below won't work
vim.g.lightline.component_expand = {
    ["linter_checking"] = "lightline#ale#checking",
    ["linter_warnings"] = "lightline#ale#warnings",
    ["linter_errors"] = "lightline#ale#errors",
    ["linter_ok"] = "lightline#ale#ok"
}

vim.g.lightline.component_type = {
    ["linter_checking"] = "left",
    ["linter_warnings"] = "warning",
    ["linter_errors"] = "error",
    ["linter_ok"] = "left"
}

vim.g.lightline.active.right = {
    {"linter_checking", "linter_errors", "linter_warnings", "linter_ok"},
    {"percent"}, {"fileformat", "fileencoding", "filetype"}, {"lineinfo"}
}

