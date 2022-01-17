--------------------------------------------------------------------------------
--
--                     _             _             _
--                    | |           (_)           | |
--               _ __ | |_   _  __ _ _ _ __  ___  | |_   _  __ _
--              | '_ \| | | | |/ _` | | '_ \/ __| | | | | |/ _` |
--              | |_) | | |_| | (_| | | | | \__ \_| | |_| | (_| |
--              | .__/|_|\__,_|\__, |_|_| |_|___(_)_|\__,_|\__,_|
--              | |             __/ |
--              |_|            |___/
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains all the plugin packadd!s and settings
--
-- plugins without configuration
--------------------------------------------------------------------------------

local plugin = require("plugin")

plugin.load("vim-eunuch")
plugin.load("vim-trailing-whitespace")
plugin.load("salt-vim")
plugin.load("rust.vim")
plugin.load("vim-crystal")
plugin.load("vim-fugitive")

--------------------------------------------------------------------------------
-- Comment.nvim settings
--------------------------------------------------------------------------------

plugin.load("Comment.nvim")

require('Comment').setup({
    ---Add a space b/w comment and the line
    ---@type boolean
    padding = true,

    ---Whether the cursor should stay at its position
    ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
    ---@type boolean
    sticky = true,

    ---Lines to be ignored while comment/uncomment.
    ---Could be a regex string or a function that returns a regex string.
    ---Example: Use '^$' to ignore empty lines
    ---@type string|fun():string
    ignore = nil,

    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },

    ---LHS of extra mappings
    ---@type table
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },

    ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    ---@type table
    mappings = {
        ---Operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        basic = true,
        ---Extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = true,
        ---Extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = false,
    },

    ---Pre-hook, called before commenting the line
    ---@type fun(ctx: Ctx):string
    pre_hook = nil,

    ---Post-hook, called after commenting is done
    ---@type fun(ctx: Ctx)
    post_hook = nil,
})

--------------------------------------------------------------------------------
-- gitsigns.nvim settings
--------------------------------------------------------------------------------

plugin.load("plenary.nvim")
plugin.load("gitsigns.nvim")

require("gitsigns").setup({
    signs = {
        add = {
            hl = "GitSignsAdd",
            text = "+",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn"
        },
        change = {
            hl = "GitSignsChange",
            text = "~",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn"
        },
        delete = {
            hl = "GitSignsDelete",
            text = "-",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn"
        },
        topdelete = {
            hl = "GitSignsDelete",
            text = "-",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn"
        },
        changedelete = {
            hl = "GitSignsChange",
            text = "~",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn"
        }
    }
})

--------------------------------------------------------------------------------
-- neoformat settings
--------------------------------------------------------------------------------

plugin.load("neoformat")

vim.api.nvim_set_keymap("", "<leader>k", ":Neoformat<cr>",
                        {noremap = true, silent = true})

--------------------------------------------------------------------------------
-- Ale settings
--------------------------------------------------------------------------------

plugin.load("ale")

--   "let g:ale_set_highlights = 0
vim.cmd("highlight ALEError ctermbg=none cterm=underline")
vim.cmd("highlight ALEWarning ctermbg=none cterm=underline")

--------------------------------------------------------------------------------
-- vim-ocaml settings
--------------------------------------------------------------------------------

plugin.load("vim-ocaml")

vim.g.ocaml_folding = 1

