--------------------------------------------------------------------------------
--
--                          _            _
--                         | |          | |
--                         | |___ _ __  | |_   _  __ _
--                         | / __| '_ \ | | | | |/ _` |
--                         | \__ \ |_) || | |_| | (_| |
--                         |_|___/ .__(_)_|\__,_|\__,_|
--                               | |
--                               |_|
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- This file contains all the lsp related configs such as nvim-lspconfig
--------------------------------------------------------------------------------

local yapm = require("yapm")

yapm.load("nvim-lspconfig")
yapm.load("cmp-nvim-lsp")

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

if vim.fn.executable("ansible-language-server") == 1 then
    require("lspconfig").ansiblels.setup(standard_lsp_options)
end

if vim.fn.executable("terraform-ls") == 1 then
    require("lspconfig").terraformls.setup(standard_lsp_options)
end

--------------------------------------------------------------------------------
-- neovim trouble settings
--
-- Trouble is a trouble/issues menu for lsp
--------------------------------------------------------------------------------

yapm.load("trouble.nvim")
require("trouble").setup({})

