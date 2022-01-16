--------------------------------------------------------------------------------
--
--     _                                     _      _         _
--    | |                                   | |    | |       | |
--    | |___ _ __   ___ ___  _ __ ___  _ __ | | ___| |_ ___  | |_   _  __ _
--    | / __| '_ \ / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \ | | | | |/ _` |
--    | \__ \ |_) | (_| (_) | | | | | | |_) | |  __/ ||  __/_| | |_| | (_| |
--    |_|___/ .__/ \___\___/|_| |_| |_| .__/|_|\___|\__\___(_)_|\__,_|\__,_|
--          | |                       | |
--          |_|                       |_|
--
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains all the lsp related configs such as nvim-lspconfig and
-- autocompletion (which uses lsp as a source)
--------------------------------------------------------------------------------

local plugin = require("plugin")

plugin.load("nvim-lspconfig")
plugin.load("nvim-cmp")
plugin.load("cmp-nvim-lsp")
plugin.load("cmp-buffer")
plugin.load("cmp-nvim-lua")
plugin.load("cmp-path")
plugin.load("luasnip")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
                   opts)
    buf_set_keymap("n", "<space>wa",
                   "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr",
                   "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl",
                   "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
                   opts)
    buf_set_keymap("n", "<space>D",
                   "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",
                   opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>",
                   opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>",
                   opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                   opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

local standard_lsp_options = {on_attach = on_attach, capabilities = capabilities}

if vim.fn.executable("lua-language-server") == 1 then
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    require("lspconfig").sumneko_lua.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = runtime_path
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {"vim"},
                    disable = {"lowercase-global"}
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true)
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {enable = false}
            }
        }
    })
end

if vim.fn.executable("clangd") == 1 then
    require("lspconfig").clangd.setup(standard_lsp_options)
end

if vim.fn.executable("ocamllsp") == 1 then
    require("lspconfig").ocamllsp.setup(standard_lsp_options)
end

if vim.fn.executable("rust-analyzer") == 1 then
    require("lspconfig").rust_analyzer.setup(standard_lsp_options)
end

if vim.fn.executable("pyright") == 1 then
    require("lspconfig").pyright.setup(standard_lsp_options)
end

if vim.fn.executable("bash-language-server") == 1 then
    require('lspconfig').bashls.setup(standard_lsp_options)
end

-- if vim.fn.executable("jedi-language-server") == 1 then
--     require("lspconfig").jedi_language_server.setup(standard_lsp_options)
-- end

if vim.fn.executable("pyright") == 1 then
    require("lspconfig").pyright.setup(standard_lsp_options)
end

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

