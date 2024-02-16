local M = {}

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

function M.render(colors)

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
    -- Standard syntax highlighting
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
    hi.gitcommitOverflow = {
        fg = colors.base08,
        ctermfg = terminal_colors.cterm08
    }
    hi.gitcommitSummary = {
        fg = colors.base0B,
        ctermfg = terminal_colors.cterm0B
    }
    hi.gitcommitComment = {
        fg = colors.base03,
        ctermfg = terminal_colors.cterm03
    }
    hi.gitcommitUntracked = {
        fg = colors.base03,
        ctermfg = terminal_colors.cterm03
    }
    hi.gitcommitDiscarded = {
        fg = colors.base03,
        ctermfg = terminal_colors.cterm03
    }
    hi.gitcommitSelected = {
        fg = colors.base03,
        ctermfg = terminal_colors.cterm03
    }
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

    -- LSP + Diagnostic highlighting
    hi.DiagnosticError = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
    hi.DiagnosticWarn = {fg = colors.base0E, ctermfg = terminal_colors.cterm0E}
    hi.DiagnosticInfo = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
    hi.DiagnosticHint = {fg = colors.base0C, ctermfg = terminal_colors.cterm0C}
    hi.DiagnosticUnderlineError = {undercurl = true, sp = colors.base08}
    hi.DiagnosticUnderlineWarning = {undercurl = true, sp = colors.base0E}
    hi.DiagnosticUnderlineWarn = {undercurl = true, sp = colors.base0E}
    hi.DiagnosticUnderlineInformation = {undercurl = true, sp = colors.base0F}
    hi.DiagnosticUnderlineHint = {undercurl = true, sp = colors.base0C}

    hi.LspReferenceText = {underline = true, sp = colors.base04}
    hi.LspReferenceRead = {underline = true, sp = colors.base04}
    hi.LspReferenceWrite = {underline = true, sp = colors.base04}
    hi.LspDiagnosticsDefaultError = {link = 'DiagnosticError'}
    hi.LspDiagnosticsDefaultWarning = {link = 'DiagnosticWarn'}
    hi.LspDiagnosticsDefaultInformation = {link = 'DiagnosticInfo'}
    hi.LspDiagnosticsDefaultHint = {link = 'DiagnosticHint'}
    hi.LspDiagnosticsUnderlineError = {link = 'DiagnosticUnderlineError'}
    hi.LspDiagnosticsUnderlineWarning = {link = 'DiagnosticUnderlineWarning'}
    hi.LspDiagnosticsUnderlineInformation = {
        link = 'DiagnosticUnderlineInformation'
    }
    hi.LspDiagnosticsUnderlineHint = {link = 'DiagnosticUnderlineHint'}

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

    hi.TSAnnotation = {fg = colors.base0F, ctermfg = terminal_colors.cterm0F}
    hi.TSAttribute = {fg = colors.base0A, ctermfg = terminal_colors.cterm0A}
    hi.TSBoolean = {fg = colors.base09, ctermfg = terminal_colors.cterm09}
    hi.TSCharacter = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
    hi.TSComment = {
        fg = colors.base03,
        italic = true,
        ctermfg = terminal_colors.cterm03
    }
    hi.TSConstructor = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
    hi.TSConditional = {fg = colors.base0E, ctermfg = terminal_colors.cterm0E}
    hi.TSConstant = {fg = colors.base09, ctermfg = terminal_colors.cterm09}
    hi.TSConstBuiltin = {
        fg = colors.base09,
        italic = true,
        ctermfg = terminal_colors.cterm09
    }
    hi.TSConstMacro = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
    hi.TSError = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
    hi.TSException = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
    hi.TSField = {fg = colors.base05, ctermfg = terminal_colors.cterm05}
    hi.TSFloat = {fg = colors.base09, ctermfg = terminal_colors.cterm09}
    hi.TSFunction = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
    hi.TSFuncBuiltin = {
        fg = colors.base0D,
        italic = true,
        ctermfg = terminal_colors.cterm0D
    }
    hi.TSFuncMacro = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
    hi.TSInclude = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
    hi.TSKeyword = {fg = colors.base0E, ctermfg = terminal_colors.cterm0E}
    hi.TSKeywordFunction = {
        fg = colors.base0E,
        ctermfg = terminal_colors.cterm0E
    }
    hi.TSKeywordOperator = {
        fg = colors.base0E,
        ctermfg = terminal_colors.cterm0E
    }
    hi.TSLabel = {fg = colors.base0A, ctermfg = terminal_colors.cterm0A}
    hi.TSMethod = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
    hi.TSNamespace = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
    hi.TSNone = {fg = colors.base05, ctermfg = terminal_colors.cterm05}
    hi.TSNumber = {fg = colors.base09, ctermfg = terminal_colors.cterm09}
    hi.TSOperator = {fg = colors.base05, ctermfg = terminal_colors.cterm05}
    hi.TSParameter = {fg = colors.base05, ctermfg = terminal_colors.cterm05}
    hi.TSParameterReference = {
        fg = colors.base05,
        ctermfg = terminal_colors.cterm05
    }
    hi.TSProperty = {fg = colors.base05, ctermfg = terminal_colors.cterm05}
    hi.TSPunctDelimiter = {
        fg = colors.base0F,
        ctermfg = terminal_colors.cterm0F
    }
    hi.TSPunctBracket = {fg = colors.base05, ctermfg = terminal_colors.cterm05}
    hi.TSPunctSpecial = {fg = colors.base0F, ctermfg = terminal_colors.cterm0F}
    hi.TSRepeat = {fg = colors.base0E, ctermfg = terminal_colors.cterm0E}
    hi.TSString = {fg = colors.base0B, ctermfg = terminal_colors.cterm0B}
    hi.TSStringRegex = {fg = colors.base0C, ctermfg = terminal_colors.cterm0C}
    hi.TSStringEscape = {fg = colors.base0C, ctermfg = terminal_colors.cterm0C}
    hi.TSSymbol = {fg = colors.base0B, ctermfg = terminal_colors.cterm0B}
    hi.TSTag = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
    hi.TSTagDelimiter = {fg = colors.base0F, ctermfg = terminal_colors.cterm0F}
    hi.TSText = {fg = colors.base05, ctermfg = terminal_colors.cterm05}
    hi.TSStrong = {bold = true}
    hi.TSEmphasis = {
        fg = colors.base09,
        italic = true,
        ctermfg = terminal_colors.cterm09
    }
    hi.TSUnderline = {
        fg = colors.base00,
        underline = true,
        ctermfg = terminal_colors.cterm00
    }
    hi.TSStrike = {
        fg = colors.base00,
        strikethrough = true,
        ctermfg = terminal_colors.cterm00
    }
    hi.TSTitle = {fg = colors.base0D, ctermfg = terminal_colors.cterm0D}
    hi.TSLiteral = {fg = colors.base09, ctermfg = terminal_colors.cterm09}
    hi.TSURI = {
        fg = colors.base09,
        underline = true,
        ctermfg = terminal_colors.cterm09
    }
    hi.TSType = {fg = colors.base0A, ctermfg = terminal_colors.cterm0A}
    hi.TSTypeBuiltin = {
        fg = colors.base0A,
        italic = true,
        ctermfg = terminal_colors.cterm0A
    }
    hi.TSVariable = {fg = colors.base08, ctermfg = terminal_colors.cterm08}
    hi.TSVariableBuiltin = {
        fg = colors.base08,
        italic = true,
        ctermfg = terminal_colors.cterm08
    }

    hi.TSDefinition = {underline = true, sp = colors.base04}
    hi.TSDefinitionUsage = {underline = true, sp = colors.base04}
    hi.TSCurrentScope = {bold = true}

    hi.LspInlayHint = {
        fg = colors.base03,
        italic = true,
        ctermfg = terminal_colors.cterm03
    }

    -- More treesitter highlights
    hi['@comment'] = {link = 'TSComment'}
    hi['@error'] = {link = 'TSError'}
    hi['@none'] = {link = 'TSNone'}
    hi['@preproc'] = {link = 'PreProc'}
    hi['@define'] = {link = 'Define'}
    hi['@operator'] = {link = 'TSOperator'}
    hi['@punctuation.delimiter'] = {link = 'TSPunctDelimiter'}
    hi['@punctuation.bracket'] = {link = 'TSPunctBracket'}
    hi['@punctuation.special'] = {link = 'TSPunctSpecial'}
    hi['@string'] = {link = 'TSString'}
    hi['@string.regex'] = {link = 'TSStringRegex'}
    hi['@string.escape'] = {link = 'TSStringEscape'}
    hi['@string.special'] = {link = 'SpecialChar'}
    hi['@character'] = {link = 'TSCharacter'}
    hi['@character.special'] = {link = 'SpecialChar'}
    hi['@boolean'] = {link = 'TSBoolean'}
    hi['@number'] = {link = 'TSNumber'}
    hi['@float'] = {link = 'TSFloat'}
    hi['@function'] = {link = 'TSFunction'}
    hi['@function.call'] = {link = 'TSFunction'}
    hi['@function.builtin'] = {link = 'TSFuncBuiltin'}
    hi['@function.macro'] = {link = 'TSFuncMacro'}
    hi['@method'] = {link = 'TSMethod'}
    hi['@method.call'] = {link = 'TSMethod'}
    hi['@constructor'] = {link = 'TSConstructor'}
    hi['@parameter'] = {link = 'TSParameter'}
    hi['@keyword'] = {link = 'TSKeyword'}
    hi['@keyword.function'] = {link = 'TSKeywordFunction'}
    hi['@keyword.operator'] = {link = 'TSKeywordOperator'}
    hi['@keyword.return'] = {link = 'TSKeyword'}
    hi['@conditional'] = {link = 'TSConditional'}
    hi['@repeat'] = {link = 'TSRepeat'}
    hi['@debug'] = {link = 'Debug'}
    hi['@label'] = {link = 'TSLabel'}
    hi['@include'] = {link = 'TSInclude'}
    hi['@exception'] = {link = 'TSException'}
    hi['@type'] = {link = 'TSType'}
    hi['@type.builtin'] = {link = 'TSTypeBuiltin'}
    hi['@type.qualifier'] = {link = 'TSKeyword'}
    hi['@type.definition'] = {link = 'TSType'}
    hi['@storageclass'] = {link = 'StorageClass'}
    hi['@attribute'] = {link = 'TSAttribute'}
    hi['@field'] = {link = 'TSField'}
    hi['@property'] = {link = 'TSProperty'}
    hi['@variable'] = {link = 'TSVariable'}
    hi['@variable.builtin'] = {link = 'TSVariableBuiltin'}
    hi['@constant'] = {link = 'TSConstant'}
    hi['@constant.builtin'] = {link = 'TSConstant'}
    hi['@constant.macro'] = {link = 'TSConstant'}
    hi['@namespace'] = {link = 'TSNamespace'}
    hi['@symbol'] = {link = 'TSSymbol'}
    hi['@text'] = {link = 'TSText'}
    hi['@text.diff.add'] = {link = 'DiffAdd'}
    hi['@text.diff.delete'] = {link = 'DiffDelete'}
    hi['@text.strong'] = {link = 'TSStrong'}
    hi['@text.emphasis'] = {link = 'TSEmphasis'}
    hi['@text.underline'] = {link = 'TSUnderline'}
    hi['@text.strike'] = {link = 'TSStrike'}
    hi['@text.title'] = {link = 'TSTitle'}
    hi['@text.literal'] = {link = 'TSLiteral'}
    hi['@text.uri'] = {link = 'TSUri'}
    hi['@text.math'] = {link = 'Number'}
    hi['@text.environment'] = {link = 'Macro'}
    hi['@text.environment.name'] = {link = 'Type'}
    hi['@text.reference'] = {link = 'TSParameterReference'}
    hi['@text.todo'] = {link = 'Todo'}
    hi['@text.note'] = {link = 'Tag'}
    hi['@text.warning'] = {link = 'DiagnosticWarn'}
    hi['@text.danger'] = {link = 'DiagnosticError'}
    hi['@tag'] = {link = 'TSTag'}
    hi['@tag.attribute'] = {link = 'TSAttribute'}
    hi['@tag.delimiter'] = {link = 'TSTagDelimiter'}

    hi['@function.method'] = {link = '@method'}
    hi['@function.method.call'] = {link = '@method.call'}
    hi['@comment.error'] = {link = '@text.danger'}
    hi['@comment.warning'] = {link = '@text.warning'}
    hi['@comment.hint'] = {link = 'DiagnosticHint'}
    hi['@comment.info'] = {link = 'DiagnosticInfo'}
    hi['@comment.todo'] = {link = '@text.todo'}
    hi['@diff.plus'] = {link = '@text.diff.add'}
    hi['@diff.minus'] = {link = '@text.diff.delete'}
    hi['@diff.delta'] = {link = 'DiffChange'}
    hi['@string.special.url'] = {link = '@text.uri'}
    hi['@keyword.directive'] = {link = '@preproc'}
    hi['@keyword.directive.define'] = {link = '@define'}
    hi['@keyword.storage'] = {link = '@storageclass'}
    hi['@keyword.conditional'] = {link = '@conditional'}
    hi['@keyword.debug'] = {link = '@debug'}
    hi['@keyword.exception'] = {link = '@exception'}
    hi['@keyword.import'] = {link = '@include'}
    hi['@keyword.repeat'] = {link = '@repeat'}
    hi['@variable.parameter'] = {link = '@parameter'}
    hi['@variable.member'] = {link = '@field'}
    hi['@module'] = {link = '@namespace'}
    hi['@number.float'] = {link = '@float'}
    hi['@string.special.symbol'] = {link = '@symbol'}
    hi['@string.regexp'] = {link = '@string.regex'}
    hi['@markup.strong'] = {link = '@text.strong'}
    hi['@markup.italic'] = {link = '@text.italic'}
    hi['@markup.link'] = {link = '@text.link'}
    hi['@markup.strikethrough'] = {link = '@text.strikethrough'}
    hi['@markup.heading'] = {link = '@text.title'}
    hi['@markup.raw'] = {link = '@text.literal'}
    hi['@markup.link'] = {link = '@text.reference'}
    hi['@markup.link.url'] = {link = '@text.uri'}
    hi['@markup.link.label'] = {link = '@string.special'}
    hi['@markup.list'] = {link = '@punctuation.special'}

    hi.EndOfBuffer = {bg = colors.base01, ctermbg = terminal_colors.cterm01}

    for group, settings in pairs(hi) do
        vim.api.nvim_set_hl(0, group, settings)
    end

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

end

return M
