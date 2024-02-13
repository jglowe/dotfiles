--------------------------------------------------------------------------------
--
--                       _             _         _
--                      | |           (_)       | |
--                 _ __ | |_   _  __ _ _ _ __   | |_   _  __ _
--                | '_ \| | | | |/ _` | | '_ \  | | | | |/ _` |
--                | |_) | | |_| | (_| | | | | |_| | |_| | (_| |
--                | .__/|_|\__,_|\__, |_|_| |_(_)_|\__,_|\__,_|
--                | |             __/ |
--                |_|            |___/
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- plugins for neovim
--------------------------------------------------------------------------------
-- The plugin loader
local yapm = require("yapm")

--------------------------------------------------------------------------------
-- Appearence
--------------------------------------------------------------------------------

-- Adds annoying red for trailing whitespace
yapm.load("bronson/vim-trailing-whitespace")

-- Base16 Color schemes
-- It is quite nifty to have them
yapm.load("chriskempson/base16-vim")

-- Adds a status line below
yapm.load("nvim-lualine/lualine.nvim")
yapm.load("nvim-lua/lsp-status.nvim")

-- Colors columns beyond the textwidth background to show the line limit
local number_range = {}
for i = 1, 254 do table.insert(number_range, tostring(i)) end
vim.opt.colorcolumn = '+' .. table.concat(number_range, ',+')
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

vim.cmd.colorscheme("base16-classic-dark")
vim.cmd(
    "execute 'highlight EndOfBuffer ctermbg=' . g:base16_cterm01 . ' guibg=#' . g:base16_gui01")

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

yapm.load("edkolev/tmuxline.vim")

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
-- gitsigns.nvim settings
--
-- Shows lines modified with git
--------------------------------------------------------------------------------

yapm.load("nvim-lua/plenary.nvim")
yapm.load("lewis6991/gitsigns.nvim")

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
-- nvim-tree settings
--
-- File explorer in vim
--------------------------------------------------------------------------------

yapm.load("nvim-web-devicons")
yapm.load("nvim-tree.lua")

require("nvim-tree").setup({})
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", {})

--------------------------------------------------------------------------------
-- alpha-nvim settings
--
-- A greater for neovim
--------------------------------------------------------------------------------

-- requires nvim-web-devicons included above
yapm.load("alpha-nvim")

require("alpha").setup(require("alpha.themes.startify").opts)

--------------------------------------------------------------------------------
-- vim-tmux-navigator settings
--
-- Navigating tmux and vim panes with shortcuts
--------------------------------------------------------------------------------

yapm.load("vim-tmux-navigator")

vim.g.tmux_navigator_no_mappings = 1

vim.keymap.set("n", "<C-H>", ":TmuxNavigateLeft<cr>",
               {noremap = true, silent = true})
vim.keymap.set("n", "<C-J>", ":TmuxNavigateDown<cr>",
               {noremap = true, silent = true})
vim.keymap.set("n", "<C-K>", ":TmuxNavigateUp<cr>",
               {noremap = true, silent = true})
vim.keymap.set("n", "<C-L>", ":TmuxNavigateRight<cr>",
               {noremap = true, silent = true})

--------------------------------------------------------------------------------
-- telescope.nvim settings
--
-- File navigation
--------------------------------------------------------------------------------

yapm.load("telescope.nvim")

require('telescope').setup {
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

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", builtin.find_files, {noremap = true})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {noremap = true})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {noremap = true})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {noremap = true})

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

vim.keymap.set("", "<F5>", ":call CurtineIncSw()<CR>", {noremap = true})

--------------------------------------------------------------------------------
-- Languages
--
-- Support for various languages
--------------------------------------------------------------------------------

yapm.load("saltstack/salt-vim")
yapm.load("rust-lang/rust.vim")
yapm.load("vim-crystal/vim-crystal")
yapm.load("rgrinberg/vim-ocaml")
yapm.load("pearofducks/ansible-vim")
yapm.load("hashivim/vim-terraform")
yapm.load("martinda/Jenkinsfile-vim-syntax")
yapm.load("PhilT/vim-fsharp")
yapm.load("lervag/vimtex")
yapm.load("ron-rs/ron.vim")

vim.g.ocaml_folding = 1

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*/playbooks/*"},
    command = "set filetype=yaml.ansible"
})

--------------------------------------------------------------------------------
-- Comment.nvim settings
--
-- code for commenting out stuff
--------------------------------------------------------------------------------

yapm.load("numToStr/Comment.nvim")

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
        block = 'gbc'
    },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb'
    },

    ---LHS of extra mappings
    ---@type table
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA'
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
        extended = false
    },

    ---Pre-hook, called before commenting the line
    ---@type fun(ctx: Ctx):string
    pre_hook = nil,

    ---Post-hook, called after commenting is done
    ---@type fun(ctx: Ctx)
    post_hook = nil
})

--------------------------------------------------------------------------------
-- neoformat settings
--
-- Autoformats code with autoformatters
--------------------------------------------------------------------------------

yapm.load("sbdchd/neoformat")

vim.api.nvim_set_keymap("", "<leader>k", ":Neoformat<cr>",
                        {noremap = true, silent = true})

--------------------------------------------------------------------------------
-- Ale settings
--
-- Linter integration for languages
--------------------------------------------------------------------------------

yapm.load("dense-analysis/ale")

--   "let g:ale_set_highlights = 0
vim.cmd("highlight ALEError ctermbg=none cterm=underline")
vim.cmd("highlight ALEWarning ctermbg=none cterm=underline")

--------------------------------------------------------------------------------
-- Autocompletion settings
--------------------------------------------------------------------------------

yapm.load("nvim-cmp")
yapm.load("cmp-nvim-lsp")
yapm.load("cmp-buffer")
yapm.load("cmp-nvim-lua")
yapm.load("cmp-path")
yapm.load("LuaSnip")
yapm.load("lspkind-nvim")

-- sets the wildmenu for tab completion
vim.opt.wildmenu = true

-- Removes searching through all the included files from CTRL-N completion
-- which can signifintly slow down autocompletion`
vim.opt.complete = vim.opt.complete - "i"

-- Sets autocomplete tab to only complete common characters for the first tab.
-- By default it autocompletes to the first item in the list, which you can tab
-- through.
vim.opt.completeopt = "menu,menuone,preview"

-- _G.tab_or_complete = function()
--     local column = vim.api.nvim_win_get_cursor(0)[2]
--     local line = vim.api.nvim_get_current_line()
--     local before_curser = line:sub(0, column)
--     if column == 0 or before_curser:match("^%s*$") then
--         return vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
--     else
--         if vim.fn.pumvisible() == 0 and vim.opt.omnifunc:get() ~= "" then
--             return vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false,
--                                                   true)
--         else
--             return vim.api.nvim_replace_termcodes("<C-n>", true, false, true)
--         end
--     end
-- end
--
-- _G.shift_tab_or_complete = function()
--     local column = vim.api.nvim_win_get_cursor(0)[2]
--     local line = vim.api.nvim_get_current_line()
--     local before_curser = line:sub(0, column)
--     if column == 0 or before_curser:match('^%s*$') then
--         return vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
--     else
--         return vim.api.nvim_replace_termcodes("<C-p>", true, false, true)
--     end
-- end

-- Tab will now autocomplete if there is leading chars
-- vim.api.nvim_set_keymap("i", "<TAB>", "<C-R>=v:lua.tab_or_complete()<CR>",
--                         {noremap = true, silent = true})

-- vim.api.nvim_set_keymap("i", "<S-TAB>",
--                         "<C-R>=v:lua.shift_tab_or_complete()<CR>",
--                         {noremap = true, silent = true})

-- Makes enter act as autocomplete select if an item is selected.
-- By default it acts like enter
-- vim.api.nvim_set_keymap("i", "<CR>",
--                         'pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"',
--                         {noremap = true, silent = true, expr = true})

local cmp = require('cmp')
local lspkind = require("lspkind")
lspkind.init()

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
        {name = "nvim_lua"}, {name = 'nvim_lsp'}, {name = "luasnip"},
        {name = 'path'}, {name = 'buffer'}
    }),
    formatting = {
        -- Youtube: How to set up nice formatting for your sources.
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                nvim_lua = "[api]",
                nvim_lsp = "[LSP]",
                path = "[path]",
                buffer = "[buf]",
                luasnip = "[snip]"
            }
        }
    }
})

--------------------------------------------------------------------------------
-- LSP Settings
--------------------------------------------------------------------------------

yapm.load("neovim/nvim-lspconfig")
yapm.load("hrsh7th/cmp-nvim-lsp")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-i>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

local standard_lsp_options = {capabilities = capabilities}

if vim.fn.executable("lua-language-server") == 1 then
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    require("lspconfig").sumneko_lua.setup({
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

-- if vim.fn.executable("clangd") == 1 then
--     require("lspconfig").clangd.setup(standard_lsp_options)
-- end

if vim.fn.executable("crystalline") == 1 then
    require'lspconfig'.crystalline.setup{standard_lsp_options}
end

if vim.fn.executable("ocamllsp") == 1 then
    require("lspconfig").ocamllsp.setup(standard_lsp_options)
end

if vim.fn.executable("rust-analyzer") == 1 then
    require("lspconfig").rust_analyzer.setup(standard_lsp_options)
end

-- if vim.fn.executable("pyright") == 1 then
--     require("lspconfig").pyright.setup(standard_lsp_options)
-- end

if vim.fn.executable("bash-language-server") == 1 then
    require('lspconfig').bashls.setup(standard_lsp_options)
end

-- if vim.fn.executable("jedi-language-server") == 1 then
--     require("lspconfig").jedi_language_server.setup(standard_lsp_options)
-- end

-- if vim.fn.executable("pyright") == 1 then
--     require("lspconfig").pyright.setup(standard_lsp_options)
-- end
--
if vim.fn.executable("ansible-language-server") == 1 then
    require("lspconfig").ansiblels.setup(standard_lsp_options)
end

if vim.fn.executable("fsautocomplete") == 1 then
    require'lspconfig'.fsautocomplete.setup{}
end

if vim.fn.executable("terraform-ls") == 1 then
    require("lspconfig").terraformls.setup(standard_lsp_options)
end

--------------------------------------------------------------------------------
-- neovim trouble settings
--
-- Trouble is a trouble/issues menu for lsp
--------------------------------------------------------------------------------

yapm.load("folke/trouble.nvim")
require("trouble").setup({})

