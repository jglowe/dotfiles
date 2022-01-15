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

vim.cmd("packadd! vim-eunuch")
vim.cmd("packadd! vim-trailing-whitespace")
vim.cmd("packadd! salt-vim")
vim.cmd("packadd! rust.vim")
vim.cmd("packadd! vim-crystal")
-- vim.cmd("packadd! vim-fugitive")
-- vim.cmd("packadd! vim-gutentags")
-- vim.cmd("packadd! poppy.vim")
-- vim.cmd("packadd! vim-reason-plus")

--------------------------------------------------------------------------------
-- color scheme settings
--------------------------------------------------------------------------------

vim.opt.termguicolors = true

vim.cmd("packadd! base16-vim")

vim.g.base16colorspace = 256

vim.cmd("colorscheme base16-classic-dark")

-- If the color scheme changes, you will have to find these in the color scheme
-- to update the EndOfBuffer Colors
--
-- vim.cmd('highlight EndOfBuffer ctermbg=g:base16_cterm01
--                              \ guibg=g:base16_gui01')
vim.cmd("highlight EndOfBuffer ctermbg=18 guibg=#202020")

--------------------------------------------------------------------------------
-- Lightline settings
--------------------------------------------------------------------------------

vim.cmd("packadd! lightline.vim")
vim.cmd("packadd! vim-gitbranch")
vim.cmd("packadd! vim-lightline-base16")

-- Shows cool status bar
vim.opt.laststatus = 2
vim.opt.showmode = false

vim.g.lightline = {
    ["active"] = {
        ["left"] = {
            {"mode", "paste"}, {"gitbranch", "readonly", "filename", "modified"}
        }
    },
    ["component_function"] = {["gitbranch"] = "gitbranch#name"},
    ["colorscheme"] = "base16_classic_dark"
}

-- Lua can't update global values internals like you would expect
--
-- https://github.com/neovim/neovim/issues/12544
--
-- vim.g.lightline["colorscheme"] = 'base16_classic_dark'

-- So what is below won't work
vim.g.lightline.component_expand = {
    ["linter_checking"] = "lightline#ale#checking",
    ["linter_warnings"] = "lightline#ale#warnings",
    ["linter_errors"] = "lightline#ale#errors",
    ["linter_ok"] = "lightline#ale#ok"
}

vim.g.lightline.component_type = {
    ["linter_checking"] = "left",
    ["linter_warnings"] = "warning",
    ["linter_errors"] = "error",
    ["linter_ok"] = "left"
}

vim.g.lightline.active.right = {
    {"linter_checking", "linter_errors", "linter_warnings", "linter_ok"},
    {"percent"}, {"fileformat", "fileencoding", "filetype"}, {"lineinfo"}
}

--------------------------------------------------------------------------------
-- alpha-nvim settings
--------------------------------------------------------------------------------

vim.cmd("packadd! nvim-web-devicons")
vim.cmd("packadd! nvim-tree.lua")

require("nvim-tree").setup({})
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", {})

--------------------------------------------------------------------------------
-- alpha-nvim settings
--------------------------------------------------------------------------------

-- requires nvim-web-devicons included above
vim.cmd("packadd! alpha-nvim")

require("alpha").setup(require("alpha.themes.startify").opts)

--------------------------------------------------------------------------------
-- vim-commentary settings
--------------------------------------------------------------------------------

vim.cmd("packadd! vim-commentary")

vim.cmd("autocmd FileType cpp setlocal commentstring=//%s")
vim.api.nvim_set_keymap("", "<leader>/", ":Commentary<CR>", {})

--------------------------------------------------------------------------------
-- vim-tmux-navigator settings
--------------------------------------------------------------------------------

vim.cmd("packadd! vim-tmux-navigator")

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

vim.cmd("packadd! plenary.nvim")
vim.cmd("packadd! gitsigns.nvim")

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
-- LSP and autocomplete settings
--------------------------------------------------------------------------------
--
vim.cmd("packadd! nvim-lspconfig")
vim.cmd("packadd! nvim-cmp")
vim.cmd("packadd! cmp-nvim-lsp")
vim.cmd("packadd! cmp-buffer")
vim.cmd("packadd! cmp-nvim-lua")
vim.cmd("packadd! cmp-path")
vim.cmd("packadd! luasnip")

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
    require("lspconfig").clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
end

if vim.fn.executable("ocamllsp") == 1 then
    require("lspconfig").ocamllsp.setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
end

if vim.fn.executable("rust-analyzer") == 1 then
    require("lspconfig").rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
end

if vim.fn.executable("pyright") == 1 then
    require("lspconfig").pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
end

-- if vim.fn.executable("jedi-language-server") == 1 then
--     require("lspconfig").jedi_language_server.setup({
--         on_attach = on_attach,
--         capabilities = capabilities
--     })
-- end

if vim.fn.executable("pyright") == 1 then
    require("lspconfig").pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
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
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources({
        {name = "nvim_lua"}, {name = 'nvim_lsp'}, {name = 'path'},
        {name = 'buffer', keyword_length = 5}
    })
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

--------------------------------------------------------------------------------
-- neovim trouble settings
--------------------------------------------------------------------------------

vim.cmd("packadd! trouble.nvim")
require("trouble").setup({})

--------------------------------------------------------------------------------
-- neoformat settings
--------------------------------------------------------------------------------

vim.cmd("packadd! neoformat")

vim.api.nvim_set_keymap("", "<leader>k", ":Neoformat<cr>",
                        {noremap = true, silent = true})

--------------------------------------------------------------------------------
-- tmuxline settings
--------------------------------------------------------------------------------

vim.cmd("packadd! tmuxline.vim")

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

vim.cmd("packadd! CurtineIncSw.vim")

vim.api
    .nvim_set_keymap("", "<F5>", ":call CurtineIncSw()<CR>", {noremap = true})

--------------------------------------------------------------------------------
-- Ale settings
--------------------------------------------------------------------------------

vim.cmd("packadd! ale")
vim.cmd("packadd! lightline-ale")

--   "let g:ale_set_highlights = 0
vim.cmd("highlight ALEError ctermbg=none cterm=underline")
vim.cmd("highlight ALEWarning ctermbg=none cterm=underline")

--------------------------------------------------------------------------------
-- TAGBAR settings
--------------------------------------------------------------------------------

vim.cmd("packadd! tagbar")

vim.api.nvim_set_keymap("n", "<S-t>", ":TagbarToggle<CR>", {})

--------------------------------------------------------------------------------
-- vim-smooth-scroll settings
--------------------------------------------------------------------------------

vim.cmd("packadd! vim-smooth-scroll")
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

vim.cmd("packadd! vim-ocaml")

vim.g.ocaml_folding = 1

