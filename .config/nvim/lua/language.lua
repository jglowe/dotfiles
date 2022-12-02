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
local yapm = require("yapm")

yapm.load("saltstack/salt-vim")
yapm.load("rust-lang/rust.vim")
yapm.load("vim-crystal/vim-crystal")
yapm.load("rgrinberg/vim-ocaml")
yapm.load("pearofducks/ansible-vim")
yapm.load("hashivim/vim-terraform")
yapm.load("martinda/Jenkinsfile-vim-syntax")

vim.g.ocaml_folding = 1

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*/playbooks/*"},
    command = "set filetype=yaml.ansible"
})
