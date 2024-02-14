local colors = {
    base00 = "#151515",
    base01 = "#202020",
    base02 = "#303030",
    base03 = "#505050",
    base04 = "#B0B0B0",
    base05 = "#D0D0D0",
    base06 = "#E0E0E0",
    base07 = "#F5F5F5",
    base08 = "#AC4142",
    base09 = "#D28445",
    base0A = "#F4BF75",
    base0B = "#90A959",
    base0C = "#75B5AA",
    base0D = "#6A9FB5",
    base0E = "#AA759F",
    base0F = "#8F5536"
}

local terminal_colors = {
    cterm00 = 0,
    cterm03 = 8,
    cterm05 = 7,
    cterm07 = 15,
    cterm08 = 1,
    cterm0A = 3,
    cterm0B = 2,
    cterm0C = 6,
    cterm0D = 4,
    cterm0E = 5,
    cterm01 = 18,
    cterm02 = 19,
    cterm04 = 20,
    cterm06 = 21,
    cterm09 = 16,
    cterm0F = 17
}

vim.cmd.hi("clear")
vim.cmd.syntax("reset")
vim.o.termguicolors = true
vim.g.colors_name = "classic_dark"

hi = {}

-- Vim editor colors
hi.Normal = {
    fg = colors.base05,
    bg = colors.base00,
    ctermfg = terminal_colors.cterm05,
    ctermbg = terminal_colors.cterm00
}
hi.Bold = {bold = true}
hi.Debug = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.Directory = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
hi.Error = {
    fg = colors.base00,
    bg = colors.base08,
    ctermfg = terminal_colors.cterm00,
    ctermbg = terminal_colors.cterm08
}
hi.ErrorMsg = {
    fg = colors.base08,
    bg = colors.base00,
    ctermfg = terminal_colors.cterm08,
    ctermbg = terminal_colors.cterm00
}
hi.Exception = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.FoldColumn = {
    fg = colors.base0C,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm0C,
    ctermbg = terminal_colors.cterm01
}
hi.Folded = {
    fg = colors.base03,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm03,
    ctermbg = terminal_colors.cterm01
}
hi.IncSearch = {
    fg = colors.base01,
    bg = colors.base09,
    ctermfg = terminal_colors.cterm01,
    ctermbg = terminal_colors.cterm09
}
hi.Italic = {}
hi.Macro = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.MatchParen = {bg = colors.base03, ctermbg = terminal_colors.cterm03}
hi.ModeMsg = {fg = colors.base0B, ctermfg = terminal_colors.cterm0B}
hi.MoreMsg = {fg = colors.base0B, ctermfg = terminal_colors.cterm0B}
hi.Question = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
hi.Search = {
    fg = colors.base01,
    bg = colors.base0A,
    ctermfg = terminal_colors.cterm01,
    ctermbg = terminal_colors.cterm0A
}
hi.Substitute = {
    fg = colors.base01,
    bg = colors.base0A,
    ctermfg = terminal_colors.cterm01,
    ctermbg = terminal_colors.cterm0A
}
hi.SpecialKey = {fg = colors.base03, ctermfg = terminal_colors.cterm03}
hi.TooLong = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.Underlined = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.Visual = {bg = colors.base02, ctermbg = terminal_colors.cterm02}
hi.VisualNOS = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.WarningMsg = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.WildMenu = {
    fg = colors.base08,
    bg = colors.base0A,
    ctermfg = terminal_colors.cterm08
}
hi.Title = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
hi.Conceal = {
    fg = colors.base0D,
    bg = colors.base00,
    ctermfg = terminal_colors.cterm0D,
    ctermbg = terminal_colors.cterm00
}
hi.Cursor = {
    fg = colors.base00,
    bg = colors.base05,
    ctermfg = terminal_colors.cterm00,
    ctermbg = terminal_colors.cterm05
}
hi.NonText = {fg = colors.base03, ctermfg = terminal_colors.cterm03}
hi.LineNr = {
    fg = colors.base03,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm03,
    ctermbg = terminal_colors.cterm01
}
hi.SignColumn = {
    fg = colors.base03,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm03,
    ctermbg = terminal_colors.cterm01
}
hi.StatusLine = {
    fg = colors.base04,
    bg = colors.base02,
    ctermfg = terminal_colors.cterm04,
    ctermbg = terminal_colors.cterm02
}
hi.StatusLineNC = {
    fg = colors.base03,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm03,
    ctermbg = terminal_colors.cterm01
}
hi.VertSplit = {
    fg = colors.base02,
    bg = colors.base02,
    ctermfg = terminal_colors.cterm02,
    ctermbg = terminal_colors.cterm02
}
hi.ColorColumn = {bg = colors.base01, ctermbg = terminal_colors.cterm01}
hi.CursorColumn = {bg = colors.base01, ctermbg = terminal_colors.cterm01}
hi.CursorLine = {bg = colors.base01, ctermbg = terminal_colors.cterm01}
hi.CursorLineNr = {
    fg = colors.base04,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm04,
    ctermbg = terminal_colors.cterm01
}
hi.QuickFixLine = {bg = colors.base01, ctermbg = terminal_colors.cterm01}
hi.PMenu = {
    fg = colors.base05,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm05,
    ctermbg = terminal_colors.cterm01
}
hi.PMenuSel = {
    fg = colors.base01,
    bg = colors.base05,
    ctermfg = terminal_colors.cterm01,
    ctermbg = terminal_colors.cterm05
}
hi.TabLine = {
    fg = colors.base03,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm03,
    ctermbg = terminal_colors.cterm01
}
hi.TabLineFill = {
    fg = colors.base03,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm03,
    ctermbg = terminal_colors.cterm01
}
hi.TabLineSel = {
    fg = colors.base0B,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm0B,
    ctermbg = terminal_colors.cterm01
}
-- " Standard syntax highlighting
hi.Boolean = {fg = colors.base09, ctermfg = terminal_colors.cterm09}
hi.Character = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.Comment = {fg = colors.base03, ctermfg = terminal_colors.cterm03}
hi.Conditional = {fg = colors.base0E, ctermfg = terminal_colors.cterm0E}
hi.Constant = {fg = colors.base09, ctermfg = terminal_colors.cterm09}
hi.Define = {fg = colors.base0E, ctermfg = terminal_colors.cterm0E}
hi.Delimiter = {fg = colors.base0F, ctermfg = terminal_colors.cterm0F}
hi.Float = {fg = colors.base09, ctermfg = terminal_colors.cterm09}
hi.Function = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
hi.Identifier = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.Include = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
hi.Keyword = {fg = colors.base0E, ctermfg = terminal_colors.cterm0E}
hi.Label = {fg = colors.base0A, ctermfg = terminal_colors.cterm0A}
hi.Number = {fg = colors.base09, ctermfg = terminal_colors.cterm09}
hi.Operator = {fg = colors.base05, ctermfg = terminal_colors.cterm05}
hi.PreProc = {fg = colors.base0A, ctermfg = terminal_colors.cterm0A}
hi.Repeat = {fg = colors.base0A, ctermfg = terminal_colors.cterm0A}
hi.Special = {fg = colors.base0C, ctermfg = terminal_colors.cterm0C}
hi.SpecialChar = {fg = colors.base0F, ctermfg = terminal_colors.cterm0F}
hi.Statement = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.StorageClass = {fg = colors.base0A, ctermfg = terminal_colors.cterm0A}
hi.String = {fg = colors.base0B, ctermfg = terminal_colors.cterm0B}
hi.Structure = {fg = colors.base0E, ctermfg = terminal_colors.cterm0E}
hi.Tag = {fg = colors.base0A, ctermfg = terminal_colors.cterm0A}
hi.Todo = {
    fg = colors.base0A,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm0A,
    ctermbg = terminal_colors.cterm01
}
hi.Type = {fg = colors.base0A, ctermfg = terminal_colors.cterm0A}
hi.Typedef = {fg = colors.base0A, ctermfg = terminal_colors.cterm0A}

-- " C highlighting
-- call <sid>hi("cOperator",   s:gui0C, "", s:cterm0C, "", "", "")
-- call <sid>hi("cPreCondit",  s:gui0E, "", s:cterm0E, "", "", "")
--
-- " C# highlighting
-- call <sid>hi("csClass",                 s:gui0A, "", s:cterm0A, "", "", "")
-- call <sid>hi("csAttribute",             s:gui0A, "", s:cterm0A, "", "", "")
-- call <sid>hi("csModifier",              s:gui0E, "", s:cterm0E, "", "", "")
-- call <sid>hi("csType",                  s:gui08, "", s:cterm08, "", "", "")
-- call <sid>hi("csUnspecifiedStatement",  s:gui0D, "", s:cterm0D, "", "", "")
-- call <sid>hi("csContextualStatement",   s:gui0E, "", s:cterm0E, "", "", "")
-- call <sid>hi("csNewDecleration",        s:gui08, "", s:cterm08, "", "", "")
--
-- " CSS highlighting
-- call <sid>hi("cssBraces",      s:gui05, "", s:cterm05, "", "", "")
-- call <sid>hi("cssClassName",   s:gui0E, "", s:cterm0E, "", "", "")
-- call <sid>hi("cssColor",       s:gui0C, "", s:cterm0C, "", "", "")

-- Diff highlighting
hi.DiffAdd = {
    fg = colors.base0B,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm0B,
    ctermbg = terminal_colors.cterm01
}
hi.DiffChange = {
    fg = colors.base03,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm03,
    ctermbg = terminal_colors.cterm01
}
hi.DiffDelete = {
    fg = colors.base08,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm08,
    ctermbg = terminal_colors.cterm01
}
hi.DiffText = {
    fg = colors.base0D,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm0D,
    ctermbg = terminal_colors.cterm01
}
hi.DiffAdded = {
    fg = colors.base0B,
    bg = colors.base00,
    ctermfg = terminal_colors.cterm0B,
    ctermbg = terminal_colors.cterm00
}
hi.DiffFile = {
    fg = colors.base08,
    bg = colors.base00,
    ctermfg = terminal_colors.cterm08,
    ctermbg = terminal_colors.cterm00
}
hi.DiffNewFile = {
    fg = colors.base0B,
    bg = colors.base00,
    ctermfg = terminal_colors.cterm0B,
    ctermbg = terminal_colors.cterm00
}
hi.DiffLine = {
    fg = colors.base0D,
    bg = colors.base00,
    ctermfg = terminal_colors.cterm0D,
    ctermbg = terminal_colors.cterm00
}
hi.DiffRemoved = {
    fg = colors.base08,
    bg = colors.base00,
    ctermfg = terminal_colors.cterm08,
    ctermbg = terminal_colors.cterm00
}

-- Git highlighting
hi.gitcommitOverflow = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
hi.gitcommitSummary = {fg = colors.base0B, ctermfg = terminal_colors.cterm0B}
hi.gitcommitComment = {fg = colors.base03, ctermfg = terminal_colors.cterm03}
hi.gitcommitUntracked = {fg = colors.base03, ctermfg = terminal_colors.cterm03}
hi.gitcommitDiscarded = {fg = colors.base03, ctermfg = terminal_colors.cterm03}
hi.gitcommitSelected = {fg = colors.base03, ctermfg = terminal_colors.cterm03}
hi.gitcommitHeader = {fg = colors.base0E, ctermfg = terminal_colors.cterm0E}
hi.gitcommitSelectedType = {
    fg = colors.base0D,
    ctermfg = terminal_colors.cterm0D
}
hi.gitcommitUnmergedType = {
    fg = colors.base0D,
    ctermfg = terminal_colors.cterm0D
}
hi.gitcommitDiscardedType = {
    fg = colors.base0D,
    ctermfg = terminal_colors.cterm0D
}
hi.gitcommitBranch = {
    fg = colors.base09,
    ctermfg = terminal_colors.cterm09,
    bold = true
}
hi.gitcommitUntrackedFile = {
    fg = colors.base0A,
    ctermfg = terminal_colors.cterm0A
}
hi.gitcommitUnmergedFile = {
    fg = colors.base08,
    ctermfg = terminal_colors.cterm08,
    bold = true
}
hi.gitcommitDiscardedFile = {
    fg = colors.base08,
    ctermfg = terminal_colors.cterm08,
    bold = true
}
hi.gitcommitSelectedFile = {
    fg = colors.base0B,
    ctermfg = terminal_colors.cterm0B,
    bold = true
}

-- Git signs highlighting
hi.GitSignsAdd = {
    fg = colors.base0B,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm0B,
    ctermbg = terminal_colors.cterm01
}
hi.GitSignsChange = {
    fg = colors.base0D,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm0D,
    ctermbg = terminal_colors.cterm01
}
hi.GitSignsDelete = {
    fg = colors.base08,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm08,
    ctermbg = terminal_colors.cterm01
}
hi.GitSignsChangeDelete = {
    fg = colors.base0E,
    bg = colors.base01,
    ctermfg = terminal_colors.cterm0E,
    ctermbg = terminal_colors.cterm01
}

-- " Markdown highlighting
-- call <sid>hi("markdownCode",              s:gui0B, "", s:cterm0B, "", "", "")
-- call <sid>hi("markdownError",             s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
-- call <sid>hi("markdownCodeBlock",         s:gui0B, "", s:cterm0B, "", "", "")
-- call <sid>hi("markdownHeadingDelimiter",  s:gui0D, "", s:cterm0D, "", "", "")
--
-- " Spelling highlighting
-- call <sid>hi("SpellBad",     "", "", "", "", "undercurl", s:gui08)
-- call <sid>hi("SpellLocal",   "", "", "", "", "undercurl", s:gui0C)
-- call <sid>hi("SpellCap",     "", "", "", "", "undercurl", s:gui0D)
-- call <sid>hi("SpellRare",    "", "", "", "", "undercurl", s:gui0E)

hi.EndOfBuffer = {bg = colors.base01, ctermbg = terminal_colors.cterm01}

for group, settings in pairs(hi) do vim.api.nvim_set_hl(0, group, settings) end

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

