--------------------------------------------------------------------------------
--
--                        _             _   _               _
--                       (_)           | | (_)             | |
--      _ __   __ ___   ___  __ _  __ _| |_ _  ___  _ __   | |_   _  __ _
--     | '_ \ / _` \ \ / / |/ _` |/ _` | __| |/ _ \| '_ \  | | | | |/ _` |
--     | | | | (_| |\ V /| | (_| | (_| | |_| | (_) | | | |_| | |_| | (_| |
--     |_| |_|\__,_| \_/ |_|\__, |\__,_|\__|_|\___/|_| |_(_)_|\__,_|\__,_|
--                           __/ |
--                          |___/
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains the plugins and settings used for navigation
--------------------------------------------------------------------------------

local yapm = require("yapm")

--------------------------------------------------------------------------------
-- nvim-tree settings
--------------------------------------------------------------------------------

yapm.load("nvim-web-devicons")
yapm.load("nvim-tree.lua")

require("nvim-tree").setup({})
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", {})

--------------------------------------------------------------------------------
-- alpha-nvim settings
--------------------------------------------------------------------------------

-- requires nvim-web-devicons included above
yapm.load("alpha-nvim")

require("alpha").setup(require("alpha.themes.startify").opts)

--------------------------------------------------------------------------------
-- vim-tmux-navigator settings
--------------------------------------------------------------------------------

yapm.load("vim-tmux-navigator")

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
-- telescope.nvim settings
--------------------------------------------------------------------------------

yapm.load("plenary.nvim")
yapm.load("telescope.nvim")

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
-- TAGBAR settings
--------------------------------------------------------------------------------

yapm.load("tagbar")

vim.api.nvim_set_keymap("n", "<S-t>", ":TagbarToggle<CR>", {})

--------------------------------------------------------------------------------
-- vim-smooth-scroll settings
--------------------------------------------------------------------------------

yapm.load("vim-smooth-scroll")
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
-- CurtineIncSw cpp-h file navigator settings
--------------------------------------------------------------------------------

yapm.load("CurtineIncSw.vim")

vim.api
    .nvim_set_keymap("", "<F5>", ":call CurtineIncSw()<CR>", {noremap = true})

