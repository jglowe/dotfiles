--------------------------------------------------------------------------------
--
--          _                                            _
--         | |                                          | |
--         | | __ _ _ __   __ _ _   _  __ _  __ _  ___  | |_   _  __ _
--         | |/ _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \ | | | | |/ _` |
--         | | (_| | | | | (_| | |_| | (_| | (_| |  __/_| | |_| | (_| |
--         |_|\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___(_)_|\__,_|\__,_|
--                         __/ |             __/ |
--                        |___/             |___/
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains all the language specific plugins
--------------------------------------------------------------------------------

local plugin = require("plugin")

plugin.load("salt-vim")
plugin.load("rust.vim")
plugin.load("vim-crystal")
plugin.load("vim-ocaml")
plugin.load("ansible-vim")

vim.g.ocaml_folding = 1

vim.cmd("au BufRead,BufNewFile */playbooks/* set filetype=yaml.ansible")
