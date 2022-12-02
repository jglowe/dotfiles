--------------------------------------------------------------------------------
--
--     _           _            _        _   _               _
--    (_)         | |          | |      | | (_)             | |
--     _ _ __   __| | ___ _ __ | |_ __ _| |_ _  ___  _ __   | |_   _  __ _
--    | | '_ \ / _` |/ _ \ '_ \| __/ _` | __| |/ _ \| '_ \  | | | | |/ _` |
--    | | | | | (_| |  __/ | | | || (_| | |_| | (_) | | | |_| | |_| | (_| |
--    |_|_| |_|\__,_|\___|_| |_|\__\__,_|\__|_|\___/|_| |_(_)_|\__,_|\__,_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- Autocommands used for establishing indentation and spellchecking rules
--------------------------------------------------------------------------------
-- Deals with tab sillyness for default settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

local indentation_group = vim.api.nvim_create_augroup("indentation",
                                                      {clear = true})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"sh"},
    command = "set expandtab&",
    group = indentation_group
})

-- Changes tab settings for specific languages
vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"ocaml", "ruby", "vim"},
    command = "setlocal expandtab tabstop=2 shiftwidth=2",
    group = indentation_group
})

-- Enables spell checking for text files
vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"markdown", "text"},
    command = "set spell | highlight clear SpellBad | highlight SpellBad cterm=underline,bold",
    group = indentation_group
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"markdown"},
    command = "setlocal textwidth=80",
    group = indentation_group
})
