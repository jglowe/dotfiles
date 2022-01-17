--------------------------------------------------------------------------------
--
--               _      _                                 _
--              | |    | |                               | |
--            __| | ___| |__  _   _  __ _  __ _  ___ _ __| |_   _  __ _
--           / _` |/ _ \ '_ \| | | |/ _` |/ _` |/ _ \ '__| | | | |/ _` |
--          | (_| |  __/ |_) | |_| | (_| | (_| |  __/ | _| | |_| | (_| |
--           \__,_|\___|_.__/ \__,_|\__, |\__, |\___|_|(_)_|\__,_|\__,_|
--                                   __/ | __/ |
--                                  |___/ |___/
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--------------------------------------------------------------------------------
--
local plugin = require("plugin")

plugin.load("nvim-dap")

local dap = require('dap')

dap.adapters.python = {
    type = 'executable',
    command = 'python3',
    args = {'-m', 'debugpy.adapter'}
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",

        program = "${file}",
        pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python3'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python3'
            else
                return 'python3'
            end
        end
    }
}

vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b",
                        ":lua require'dap'.toggle_breakpoint()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>B",
                        ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>lp",
                        ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>dl", ":lua require'dap'.run_last()<CR>",
                        {noremap = true, silent = true})

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
