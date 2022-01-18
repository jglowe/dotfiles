--------------------------------------------------------------------------------
--
--                                _      _   _               _
--                               | |    | | (_)             | |
--       ___ ___  _ __ ___  _ __ | | ___| |_ _  ___  _ __   | |_   _  __ _
--      / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \  | | | | |/ _` |
--     | (_| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |_| | |_| | (_| |
--      \___\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_(_)_|\__,_|\__,_|
--                         | |
--                         |_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains all the autocompletion settings
--------------------------------------------------------------------------------

local plugin = require("plugin")

plugin.load("nvim-cmp")
plugin.load("cmp-nvim-lsp")
plugin.load("cmp-buffer")
plugin.load("cmp-nvim-lua")
plugin.load("cmp-path")
plugin.load("luasnip")

local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    documentation = {border = 'single'},
    sources = cmp.config.sources({
        {name = "nvim_lua"}, {name = 'nvim_lsp'}, {name = 'path'},
        {name = 'buffer', keyword_length = 5}
    })
})

-- cmp.setup.cmdline(':', {
--     sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
-- })

