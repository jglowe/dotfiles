--------------------------------------------------------------------------------
--
--   _        _                               _      _         _
--  | |      | |                             | |    | |       | |
--  | |_ __ _| |__   ___ ___  _ __ ___  _ __ | | ___| |_ ___  | |_   _  __ _
--  | __/ _` | '_ \ / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \ | | | | |/ _` |
--  | || (_| | |_) | (_| (_) | | | | | | |_) | |  __/ ||  __/_| | |_| | (_| |
--   \__\__,_|_.__/ \___\___/|_| |_| |_| .__/|_|\___|\__\___(_)_|\__,_|\__,_|
--                                     | |
--                                     |_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file includes the settings for tab completion. It uses omni complete
-- when available and defaults to <C-n>
--------------------------------------------------------------------------------

-- sets the wildmenu for tab completion
vim.opt.wildmenu = true

-- Removes searching through all the included files from CTRL-N completion
-- which can signifintly slow down autocompletion`
vim.opt.complete = vim.opt.complete - "i"

-- Sets autocomplete tab to only complete common characters for the first tab.
-- By default it autocompletes to the first item in the list, which you can tab
-- through.
vim.opt.completeopt = "menu,menuone,preview"

_G.tab_or_complete = function()
    local column = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local before_curser = line:sub(0, column)
    print(before_curser)
    if column == 0 or before_curser:match("^%s*$") then
        return vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
    else
        if vim.fn.pumvisible() == 0 and vim.opt.omnifunc:get() ~= "" then
            return vim.api.nvim_replace_termcodes(
                       "<C-x><C-o>",
                       true,
                       false,
                       true
                   )
        else
            return vim.api.nvim_replace_termcodes("<C-n>", true, false, true)
        end
    end
end

_G.shift_tab_or_complete = function()
    local column = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local before_curser = line:sub(0, column)
    if column == 0 or before_curser:match('^%s*$') then
        return vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
    else
        return vim.api.nvim_replace_termcodes("<C-p>", true, false, true)
    end
end

-- Tab will now autocomplete if there is leading chars
vim.api.nvim_set_keymap(
    "i",
    "<TAB>",
    "<C-R>=v:lua.tab_or_complete()<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "i",
    "<S-TAB>",
    "<C-R>=v:lua.shift_tab_or_complete()<CR>",
    { noremap = true, silent = true }
)

-- Makes enter act as autocomplete select if an item is selected.
-- By default it acts like enter
vim.api.nvim_set_keymap(
    "i",
    "<CR>",
    'pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"',
    { noremap = true, silent = true, expr = true }
)

