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
-- plugin.load("vim-reason-plus")

--------------------------------------------------------------------------------
-- nvim-tree settings
--------------------------------------------------------------------------------

plugin.load("nvim-web-devicons")
plugin.load("nvim-tree.lua")

require("nvim-tree").setup({})
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", {})

--------------------------------------------------------------------------------
-- alpha-nvim settings
--------------------------------------------------------------------------------

-- requires nvim-web-devicons included above
plugin.load("alpha-nvim")

require("alpha").setup(require("alpha.themes.startify").opts)

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

-- plugin.load("vim-commentary")

-- vim.cmd("autocmd FileType cpp setlocal commentstring=//%s")
-- vim.api.nvim_set_keymap("", "<leader>/", ":Commentary<CR>", {})

--------------------------------------------------------------------------------
-- vim-tmux-navigator settings
--------------------------------------------------------------------------------

plugin.load("vim-tmux-navigator")

vim.g.tmux_navigator_no_mappings = 1

vim.api.nvim_set_keymap("n", "<C-H>", ":TmuxNavigateLeft<cr>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-J>", ":TmuxNavigateDown<cr>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-K>", ":TmuxNavigateUp<cr>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-L>", ":TmuxNavigateRight<cr>",
                        {noremap = true, silent = true})

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
-- telescope.nvim settings
--------------------------------------------------------------------------------

plugin.load("plenary.nvim")
plugin.load("telescope.nvim")

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

vim.api.nvim_set_keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>", {noremap = true})

--------------------------------------------------------------------------------
-- neovim trouble settings
--------------------------------------------------------------------------------

plugin.load("trouble.nvim")
require("trouble").setup({})

--------------------------------------------------------------------------------
-- neoformat settings
--------------------------------------------------------------------------------

plugin.load("neoformat")

vim.api.nvim_set_keymap("", "<leader>k", ":Neoformat<cr>",
                        {noremap = true, silent = true})

--------------------------------------------------------------------------------
-- tmuxline settings
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

--------------------------------------------------------------------------------
-- CurtineIncSw cpp-h file navigator settings
--------------------------------------------------------------------------------

plugin.load("CurtineIncSw.vim")

vim.api
    .nvim_set_keymap("", "<F5>", ":call CurtineIncSw()<CR>", {noremap = true})

--------------------------------------------------------------------------------
-- Ale settings
--------------------------------------------------------------------------------

plugin.load("ale")

--   "let g:ale_set_highlights = 0
vim.cmd("highlight ALEError ctermbg=none cterm=underline")
vim.cmd("highlight ALEWarning ctermbg=none cterm=underline")

--------------------------------------------------------------------------------
-- TAGBAR settings
--------------------------------------------------------------------------------

plugin.load("tagbar")

vim.api.nvim_set_keymap("n", "<S-t>", ":TagbarToggle<CR>", {})

--------------------------------------------------------------------------------
-- vim-smooth-scroll settings
--------------------------------------------------------------------------------

plugin.load("vim-smooth-scroll")
vim.api.nvim_set_keymap("n", "<c-u>",
                        ":call smooth_scroll#up(&scroll, 10, 2)<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-d>",
                        ":call smooth_scroll#down(&scroll, 10, 2)<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-b>",
                        ":call smooth_scroll#up(&scroll*2, 20, 4)<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-f>",
                        ":call smooth_scroll#down(&scroll*2, 20, 4)<CR>",
                        {noremap = true, silent = true})

--------------------------------------------------------------------------------
-- vim-ocaml settings
--------------------------------------------------------------------------------

plugin.load("vim-ocaml")

vim.g.ocaml_folding = 1

