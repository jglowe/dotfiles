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

vim.cmd("packadd! vim-gitgutter")
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
        ["left"] = { { "mode", "paste" }, { "gitbranch", "readonly", "filename", "modified" } },
    },
    ["component_function"] = {
        ["gitbranch"] = "gitbranch#name",
    },
    ["colorscheme"] = "base16_classic_dark",
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
    ["linter_ok"] = "lightline#ale#ok",
}

vim.g.lightline.component_type = {
    ["linter_checking"] = "left",
    ["linter_warnings"] = "warning",
    ["linter_errors"] = "error",
    ["linter_ok"] = "left",
}

vim.g.lightline.active.right = {
    { "linter_checking", "linter_errors", "linter_warnings", "linter_ok" },
    { "percent" },
    { "fileformat", "fileencoding", "filetype" },
    { "lineinfo" },
}

--------------------------------------------------------------------------------
-- vim-startify settings
--------------------------------------------------------------------------------

vim.cmd("packadd! vim-startify")

vim.g.startify_custom_header = {
    "    oooooo     oooo  o8o",
    "     `888.     .8'   `\"'",
    "      `888.   .8'   oooo  ooo. .oo.  .oo.",
    '       `888. .8\'    `888  `888P"Y88bP"Y88b',
    "        `888.8'      888   888   888   888",
    "         `888'       888   888   888   888",
    "          `8'       o888o o888o o888o o888o",
}

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

vim.api.nvim_set_keymap("n", "<C-H>", ":TmuxNavigateLeft<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-J>", ":TmuxNavigateDown<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-K>", ":TmuxNavigateUp<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-L>", ":TmuxNavigateRight<cr>", { noremap = true, silent = true })

--------------------------------------------------------------------------------
-- LSP settings
--------------------------------------------------------------------------------

vim.cmd("packadd! nvim-lspconfig")
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
        disable = {"lowercase-global"}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

--------------------------------------------------------------------------------
-- neovim trouble settings
--------------------------------------------------------------------------------

vim.cmd("packadd! trouble.nvim")
require("trouble").setup({})

--------------------------------------------------------------------------------
-- tmuxline settings
--------------------------------------------------------------------------------

vim.cmd("packadd! tmuxline.vim")

-- Generate current theme by :Tmuxline lightline_insert
vim.g.tmuxline_powerline_separators = 0
vim.g.tmuxline_preset = {
    ["a"] = "#S",
    ["b"] = "#W",
    ["c"] = { "#(whoami)", "#H" },
    ["win"] = "#I #W",
    ["cwin"] = "#I #W",
    ["x"] = "%a",
    ["y"] = "#W %R",
    ["z"] = "#H",
}

--------------------------------------------------------------------------------
-- CurtineIncSw cpp-h file navigator settings
--------------------------------------------------------------------------------

vim.cmd("packadd! CurtineIncSw.vim")

vim.api.nvim_set_keymap("", "<F5>", ":call CurtineIncSw()<CR>", { noremap = true })

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

vim.api.nvim_set_keymap(
    "n",
    "<c-u>",
    ":call smooth_scroll#up(&scroll, 10, 2)<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<c-d>",
    ":call smooth_scroll#down(&scroll, 10, 2)<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<c-b>",
    ":call smooth_scroll#up(&scroll*2, 20, 4)<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<c-f>",
    ":call smooth_scroll#down(&scroll*2, 20, 4)<CR>",
    { noremap = true, silent = true }
)

--------------------------------------------------------------------------------
-- vim-ocaml settings
--------------------------------------------------------------------------------

vim.cmd("packadd! vim-ocaml")

vim.g.ocaml_folding = 1

--------------------------------------------------------------------------------
-- ocaml merlin and other plugin settings
--------------------------------------------------------------------------------

if vim.fn.executable("opam") == 1 then
    local opamshare = vim.fn.substitute(vim.fn.system("opam var share"), "[\r\n]*$", "", "")

    vim.fn.execute(
        "set rtp+="
            .. opamshare
            .. "/ocp-indent/vim,"
            .. opamshare
            .. "/ocp-index/vim,"
            .. opamshare
            .. "/merlin/vim"
    )
end

