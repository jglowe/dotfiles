-------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------

-- Deals with tab sillyness for default settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.cmd([[augroup indendation
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
