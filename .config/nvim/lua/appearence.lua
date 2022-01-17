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
plugin.load("lualine.nvim")
plugin.load("lsp-status.nvim")

-- Colors columns beyond the textwidth background to show the line limit
local number_range = {}
for i = 1, 254 do table.insert(number_range, tostring(i)) end
local focused_colorcolumn = '+' .. table.concat(number_range, ',+')

vim.opt.colorcolumn = focused_colorcolumn
vim.opt.textwidth = 80

vim.opt.fillchars = {
    diff = '∙', -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    eob = ' ', -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0)
    --          to suppress ~ at EndOfBuffer
    fold = '·', -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    vert = '┃' -- BOX DRAWINGS HEAVY VERTICAL
    --            (U+2503, UTF-8: E2 94 83)
}

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

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {left = '|', right = '|'},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'require"lsp-status".status()'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

require("lsp-status").config({status_symbol = ''})

--------------------------------------------------------------------------------
-- tmuxline settings
--
-- Something that spits out tmux config to make it match vim theming
--------------------------------------------------------------------------------

plugin.load("tmuxline.vim")

-- Generate current theme by :Tmuxline lightline_insert
vim.g.tmuxline_powerline_separators = 0
vim.g.tmuxline_preset = {
    ["a"] = "#S",
    ["b"] = "#W",
    ["c"] = {"#(whoami)", "#H"},
    ["win"] = "#I #W",
    ["cwin"] = "#I #W",
    ["x"] = "%a",
    ["y"] = "#W %R",
    ["z"] = "#H"
}

