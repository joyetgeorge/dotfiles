-- Scaryforest — a dark forest colorscheme

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "scaryforest"

-- Palette ─────────────────────────────────────────────────────────────────────
local c = {
  -- backgrounds (darkest → lightest)
  darker_black  = "#0d1917",
  black         = "#0E1F1D",  -- main bg
  black2        = "#182724",
  one_bg        = "#1d2b28",
  one_bg2       = "#243531",
  one_bg3       = "#2b3e39",
  line          = "#1c2926",
  statusline_bg = "#162420",
  lightbg       = "#22312e",
  lightbg2      = "#1b2926",

  -- greys
  grey          = "#3a4d47",
  grey_fg       = "#455952",
  grey_fg2      = "#50645c",
  light_grey    = "#5c7068",

  -- foregrounds
  white         = "#dde5e0",  -- main fg
  light_white   = "#e8f0eb",
  bright_white  = "#ecf4ef",

  -- accents
  red           = "#3ec195",
  baby_pink     = "#ab7d7d",
  pink          = "#c993b5",
  green         = "#83aa7c",
  vibrant_green = "#78b573",
  nord_blue     = "#6ba89f",
  blue          = "#77beb4",
  yellow        = "#c0b283",
  sun           = "#d0c191",
  purple        = "#8c9f87",
  dark_purple   = "#7f9279",
  teal          = "#88bdaa",
  orange        = "#c2a97d",
  cyan          = "#7ebdae",

  -- base16 syntax
  base08        = "#9d6d6d",  -- tags/html
  base09        = "#c2a97d",  -- constants/numbers
  base0A        = "#c0b283",  -- yellow/types
  base0B        = "#83aa7c",  -- green/strings
  base0C        = "#7ebdae",  -- cyan/regex
  base0D        = "#77beb4",  -- blue/functions
  base0E        = "#8c9f87",  -- purple/keywords
  base0F        = "#7a8d76",  -- deprecated/delimiters
  base03        = "#2e403b",  -- comments

  -- diff
  diff_add      = "#2d4a3e",
  diff_change   = "#2d3a4a",
  diff_delete   = "#4d2a2d",
  diff_text     = "#3d5a4e",
}

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor ──────────────────────────────────────────────────────────────────────
hi("Normal",       { fg = c.white, bg = c.black })
hi("NormalNC",     { fg = c.white, bg = c.black })
hi("NormalFloat",  { fg = c.white, bg = c.darker_black })
hi("FloatBorder",  { fg = c.grey, bg = c.darker_black })
hi("FloatTitle",   { fg = c.white, bg = c.darker_black, bold = true })
hi("SignColumn",   { bg = c.black })
hi("EndOfBuffer",  { fg = c.black })
hi("CursorLine",   { bg = c.one_bg })
hi("CursorColumn", { bg = c.one_bg })
hi("ColorColumn",  { bg = c.one_bg })
hi("Conceal",      { fg = c.grey })
hi("Cursor",       { fg = c.black, bg = c.white })
hi("lCursor",      { fg = c.black, bg = c.white })
hi("CursorIM",     { fg = c.black, bg = c.white })
hi("Visual",       { bg = c.one_bg2 })
hi("VisualNOS",    { bg = c.one_bg2 })

-- Line numbers & columns
hi("LineNr",       { fg = c.grey })
hi("CursorLineNr", { fg = c.white })
hi("FoldColumn",   { fg = c.grey, bg = c.black })
hi("CursorLineFold", { fg = c.teal, bg = c.black })
hi("Folded",       { fg = c.light_grey, bg = c.one_bg })
hi("SignColumn",   { bg = c.black })

-- Popup menu
hi("Pmenu",        { fg = c.white, bg = c.statusline_bg })
hi("PmenuSel",     { bg = c.lightbg })
hi("PmenuSbar",    { bg = c.one_bg })
hi("PmenuThumb",   { bg = c.grey })

-- Statusline & tabline
hi("StatusLine",   { fg = c.white, bg = c.statusline_bg })
hi("StatusLineNC", { fg = c.grey, bg = c.black })
hi("TabLine",      { fg = c.grey, bg = c.statusline_bg })
hi("TabLineFill",  { bg = c.darker_black })
hi("TabLineSel",   { fg = c.white, bg = c.black })
hi("WinBar",       { fg = c.white, bg = c.black })
hi("WinBarNC",     { fg = c.grey, bg = c.black })

-- Splits & borders
hi("VertSplit",    { fg = c.line })
hi("WinSeparator", { fg = c.line })

-- Search & match
hi("Search",       { fg = c.black, bg = c.yellow })
hi("IncSearch",    { fg = c.black, bg = c.orange })
hi("CurSearch",    { fg = c.black, bg = c.orange })
hi("Substitute",   { fg = c.black, bg = c.orange })
hi("MatchParen",   { fg = c.white, bg = c.one_bg3, bold = true })

-- Messages
hi("ModeMsg",      { fg = c.green, bold = true })
hi("MsgArea",      { fg = c.white })
hi("MoreMsg",      { fg = c.green })
hi("ErrorMsg",     { fg = c.baby_pink })
hi("WarningMsg",   { fg = c.yellow })
hi("Question",     { fg = c.blue })

-- Misc editor
hi("NonText",      { fg = c.grey })
hi("SpecialKey",   { fg = c.grey })
hi("Directory",    { fg = c.blue })
hi("Title",        { fg = c.blue, bold = true })
hi("WildMenu",     { fg = c.black, bg = c.blue })
hi("QuickFixLine", { bg = c.one_bg })

-- Spell
hi("SpellBad",     { undercurl = true, sp = c.baby_pink })
hi("SpellCap",     { undercurl = true, sp = c.yellow })
hi("SpellLocal",   { undercurl = true, sp = c.cyan })
hi("SpellRare",    { undercurl = true, sp = c.purple })

-- Syntax ──────────────────────────────────────────────────────────────────────
hi("Comment",      { fg = c.base03 })
hi("String",       { fg = c.base0B })
hi("Character",    { fg = c.base0B })
hi("Number",       { fg = c.base09 })
hi("Boolean",      { fg = c.base09 })
hi("Float",        { fg = c.base09 })
hi("Identifier",   { fg = c.yellow })
hi("Function",     { fg = c.base0D, bold = true })
hi("Statement",    { fg = c.base0E, bold = true })
hi("Conditional",  { fg = c.base0E, bold = true })
hi("Repeat",       { fg = c.base0E, bold = true })
hi("Label",        { fg = c.base0E, bold = true })
hi("Operator",     { fg = c.white })
hi("Keyword",      { fg = c.base0E, bold = true })
hi("Exception",    { fg = c.base0E, bold = true })
hi("PreProc",      { fg = c.base0A })
hi("Include",      { fg = c.base0D })
hi("Define",       { fg = c.base0E })
hi("Macro",        { fg = c.base0A })
hi("PreCondit",    { fg = c.base0A })
hi("Type",         { fg = c.base0A })
hi("StorageClass", { fg = c.base0A })
hi("Structure",    { fg = c.base0A })
hi("Typedef",      { fg = c.base0A })
hi("Special",      { fg = c.base0C })
hi("SpecialChar",  { fg = c.base0C })
hi("Tag",          { fg = c.base08 })
hi("Delimiter",    { fg = c.base0F })
hi("SpecialComment", { fg = c.grey_fg })
hi("Debug",        { fg = c.baby_pink })
hi("Underlined",   { underline = true })
hi("Error",        { fg = c.baby_pink })
hi("Todo",         { fg = c.yellow, bold = true })

-- Treesitter ──────────────────────────────────────────────────────────────────
hi("@variable",              { fg = c.yellow })
hi("@variable.builtin",      { fg = c.base09 })
hi("@variable.parameter",    { fg = c.white })
hi("@variable.member",       { fg = c.yellow })
hi("@property",              { fg = c.yellow })
hi("@field",                 { fg = c.yellow })

hi("@constant",              { fg = c.base09 })
hi("@constant.builtin",      { fg = c.base09 })
hi("@constant.macro",        { fg = c.base09 })

hi("@module",                { fg = c.teal })
hi("@label",                 { fg = c.base0E })

hi("@string",                { fg = c.base0B })
hi("@string.escape",         { fg = c.base0C })
hi("@string.regex",          { fg = c.base0C })
hi("@string.special",        { fg = c.base0C })
hi("@character",             { fg = c.base0B })
hi("@number",                { fg = c.base09 })
hi("@boolean",               { fg = c.base09 })
hi("@float",                 { fg = c.base09 })

hi("@function",              { fg = c.base0D, bold = true })
hi("@function.call",         { fg = c.base0D, bold = true })
hi("@function.builtin",      { fg = c.base0D, bold = true })
hi("@function.macro",        { fg = c.base0A, bold = true })
hi("@method",                { fg = c.base0D, bold = true })
hi("@method.call",           { fg = c.base0D, bold = true })
hi("@constructor",           { fg = c.base0A, bold = true })

hi("@keyword",               { fg = c.base0E, bold = true })
hi("@keyword.function",      { fg = c.base0E, bold = true })
hi("@keyword.operator",      { fg = c.base0E, bold = true })
hi("@keyword.return",        { fg = c.base0E, bold = true })
hi("@keyword.import",        { fg = c.base0D, bold = true })
hi("@keyword.export",        { fg = c.base0D, bold = true })
hi("@conditional",           { fg = c.base0E, bold = true })
hi("@repeat",                { fg = c.base0E, bold = true })
hi("@include",               { fg = c.base0D, bold = true })
hi("@exception",             { fg = c.base0E, bold = true })

hi("@type",                  { fg = c.base0A })
hi("@type.builtin",          { fg = c.base0A })
hi("@type.qualifier",        { fg = c.base0E })
hi("@type.definition",       { fg = c.base0A })

hi("@operator",              { fg = c.white })
hi("@punctuation.bracket",   { fg = c.base0F })
hi("@punctuation.delimiter", { fg = c.base0F })
hi("@punctuation.special",   { fg = c.base0C })

hi("@comment",               { fg = c.base03 })
hi("@comment.todo",          { fg = c.yellow, bold = true })
hi("@comment.error",         { fg = c.baby_pink, bold = true })
hi("@comment.warning",       { fg = c.orange, bold = true })
hi("@comment.note",          { fg = c.blue, bold = true })

hi("@tag",                   { fg = c.base08 })
hi("@tag.attribute",         { fg = c.base09 })
hi("@tag.delimiter",         { fg = c.base0F })

hi("@markup.heading",        { fg = c.blue, bold = true })
hi("@markup.heading.1.tsx",  { fg = c.white })
hi("@markup.heading.2.tsx",  { fg = c.white })
hi("@markup.heading.3.tsx",  { fg = c.white })
hi("@markup.heading.4.tsx",  { fg = c.white })
hi("@markup.heading.5.tsx",  { fg = c.white })
hi("@markup.heading.6.tsx",  { fg = c.white })
hi("@markup.strong",         { bold = true })
hi("@markup.italic",         { italic = true })
hi("@markup.strikethrough",  { strikethrough = true })
hi("@markup.link",           { fg = c.blue, underline = true })
hi("@markup.link.url",       { fg = c.cyan, underline = true })
hi("@markup.raw",            { fg = c.green })
hi("@markup.list",           { fg = c.base0F })

-- LSP semantic tokens
hi("@lsp.type.class",        { fg = c.base0A })
hi("@lsp.type.decorator",    { fg = c.base09 })
hi("@lsp.type.enum",         { fg = c.base0A })
hi("@lsp.type.enumMember",   { fg = c.base09 })
hi("@lsp.type.function",     { fg = c.base0D, bold = true })
hi("@lsp.type.interface",    { fg = c.base0A })
hi("@lsp.type.macro",        { fg = c.base0A, bold = true })
hi("@lsp.type.method",       { fg = c.base0D, bold = true })
hi("@lsp.type.namespace",    { fg = c.teal })
hi("@lsp.type.parameter",    { fg = c.white })
hi("@lsp.type.property",     { fg = c.yellow })
hi("@lsp.type.struct",       { fg = c.base0A })
hi("@lsp.type.type",         { fg = c.base0A })
hi("@lsp.type.typeParameter", { fg = c.base0A })
hi("@lsp.type.variable",     { fg = c.yellow })

-- Diagnostics ─────────────────────────────────────────────────────────────────
hi("DiagnosticError",               { fg = "#ea6962" })
hi("DiagnosticWarn",                { fg = "#d8a657" })
hi("DiagnosticInfo",                { fg = "#7daea3" })
hi("DiagnosticHint",                { fg = "#a9b665" })
hi("DiagnosticVirtualTextError",    { fg = "#ea6962" })
hi("DiagnosticVirtualTextWarn",     { fg = "#d8a657" })
hi("DiagnosticVirtualTextInfo",     { fg = "#7daea3" })
hi("DiagnosticVirtualTextHint",     { fg = "#a9b665" })
hi("DiagnosticUnderlineError",      { undercurl = true, sp = "#ea6962" })
hi("DiagnosticUnderlineWarn",       { undercurl = true, sp = "#d8a657" })
hi("DiagnosticUnderlineInfo",       { undercurl = true, sp = "#7daea3" })
hi("DiagnosticUnderlineHint",       { undercurl = true, sp = "#a9b665" })
hi("DiagnosticSignError",           { fg = "#ea6962", bg = c.black })
hi("DiagnosticSignWarn",            { fg = "#d8a657", bg = c.black })
hi("DiagnosticSignInfo",            { fg = "#7daea3", bg = c.black })
hi("DiagnosticSignHint",            { fg = "#a9b665", bg = c.black })

-- LSP references
hi("LspReferenceText",  { bg = c.one_bg2 })
hi("LspReferenceRead",  { bg = c.one_bg2 })
hi("LspReferenceWrite", { bg = c.one_bg2 })
hi("LspSignatureActiveParameter", { fg = c.orange, bold = true })
hi("LspInfoBorder",     { fg = c.grey, bg = c.darker_black })

-- Diff ────────────────────────────────────────────────────────────────────────
hi("DiffAdd",    { bg = c.diff_add })
hi("DiffChange", { bg = c.diff_change })
hi("DiffDelete", { bg = c.diff_delete, fg = "#6e3b3e" })
hi("DiffText",   { bg = c.diff_text })
hi("diffAdded",   { fg = c.green })
hi("diffRemoved",  { fg = c.baby_pink })
hi("diffChanged",  { fg = c.yellow })
hi("diffOldFile",  { fg = c.orange })
hi("diffNewFile",  { fg = c.green })
hi("diffFile",     { fg = c.blue })
hi("diffLine",     { fg = c.grey_fg })
hi("diffIndexLine", { fg = c.purple })

-- Git signs
hi("GitSignsAdd",          { fg = c.green, bg = c.black })
hi("GitSignsChange",       { fg = c.yellow, bg = c.black })
hi("GitSignsDelete",       { fg = c.baby_pink, bg = c.black })
hi("GitSignsCurrentLineBlame", { fg = c.grey_fg })

-- Telescope  ─────────────────────────────────────────
hi("TelescopeNormal",         { bg = c.darker_black })
hi("TelescopeBorder",         { fg = c.darker_black, bg = c.darker_black })
hi("TelescopePromptNormal",   { fg = c.white, bg = c.black2 })
hi("TelescopePromptBorder",   { fg = c.black2, bg = c.black2 })
hi("TelescopePromptPrefix",   { fg = c.red, bg = c.black2 })
hi("TelescopePromptTitle",    { fg = c.black, bg = c.red })
hi("TelescopePreviewTitle",   { fg = c.black, bg = c.green })
hi("TelescopeResultsTitle",   { fg = c.darker_black, bg = c.darker_black })
hi("TelescopeResultsNormal",  { bg = c.darker_black })
hi("TelescopePreviewNormal",  { bg = c.darker_black })
hi("TelescopeSelection",      { bg = c.black2, fg = c.white })
hi("TelescopeMatching",       { bg = c.one_bg, fg = c.blue })
hi("TelescopeResultsDiffAdd",    { fg = c.green })
hi("TelescopeResultsDiffChange", { fg = c.yellow })
hi("TelescopeResultsDiffDelete", { fg = c.red })

-- NvimTree ────────────────────────────────────────────────────────────────────
hi("NvimTreeNormal",           { fg = c.white, bg = c.darker_black })
hi("NvimTreeNormalNC",         { fg = c.white, bg = c.darker_black })
hi("NvimTreeWinSeparator",     { fg = c.line, bg = c.black })
hi("NvimTreeCursorLine",       { bg = c.black2 })
hi("NvimTreeIndentMarker",     { fg = c.grey })
hi("NvimTreeFolderIcon",       { fg = c.blue })
hi("NvimTreeFolderName",       { fg = c.blue })
hi("NvimTreeOpenedFolderName", { fg = c.blue })
hi("NvimTreeEmptyFolderName",  { fg = c.grey })
hi("NvimTreeRootFolder",       { fg = c.orange, bold = true })
hi("NvimTreeSpecialFile",      { fg = c.yellow })
hi("NvimTreeGitDirty",         { fg = c.yellow })
hi("NvimTreeGitNew",           { fg = c.green })
hi("NvimTreeGitDeleted",       { fg = c.baby_pink })
hi("NvimTreeGitStaged",        { fg = c.green })

-- WhichKey ────────────────────────────────────────────────────────────────────
hi("WhichKey",       { fg = c.blue })
hi("WhichKeyGroup",  { fg = c.yellow })
hi("WhichKeyDesc",   { fg = c.white })
hi("WhichKeyFloat",  { bg = c.darker_black })
hi("WhichKeySeparator", { fg = c.grey })
hi("WhichKeyValue",  { fg = c.grey_fg })

-- Lazy ────────────────────────────────────────────────────────────────────────
hi("LazyNormal",       { bg = c.darker_black })
hi("LazyButton",       { bg = c.one_bg, fg = c.white })
hi("LazyButtonActive", { bg = c.lightbg, fg = c.white })
hi("LazyH1",           { fg = c.black, bg = c.blue, bold = true })

-- Indent blankline
hi("IblIndent", { fg = c.line })
hi("IblScope",  { fg = c.grey })

-- Neogit diff colors (VS Code style)
hi("NeogitDiffAdd",              { bg = c.diff_add, fg = "#89d185" })
hi("NeogitDiffAddHighlight",     { bg = c.diff_add, fg = "#89d185" })
hi("NeogitDiffAddCursor",        { bg = "#3a5a4a", fg = "#89d185" })
hi("NeogitDiffDelete",           { bg = c.diff_delete, fg = "#f48771" })
hi("NeogitDiffDeleteHighlight",  { bg = c.diff_delete, fg = "#f48771" })
hi("NeogitDiffDeleteCursor",     { bg = "#5d3a3d", fg = "#f48771" })
hi("NeogitDiffContext",          { bg = "NONE" })
hi("NeogitDiffContextHighlight", { bg = "NONE" })
hi("NeogitHunkHeader",           { bg = c.diff_change, fg = "#7aa2f7" })
hi("NeogitHunkHeaderHighlight",  { bg = "#3d4a5a", fg = "#7aa2f7" })
hi("NeogitChangeDeleted",        { fg = "#f48771", bold = true })
hi("NeogitChangeModified",       { fg = "#e5c07b", bold = true })
hi("NeogitChangeAdded",          { fg = "#89d185", bold = true })
hi("NeogitChangeRenamed",        { fg = "#7aa2f7", bold = true })
hi("NeogitChangeCopied",         { fg = "#c678dd", bold = true })
hi("NeogitChangeUntracked",      { fg = "#e5c07b" })

-- Diffview
hi("DiffviewDiffAddAsDelete",    { bg = c.diff_delete })
hi("DiffviewDiffDelete",         { fg = "#6e3b3e" })

-- Mason
hi("MasonNormal", { bg = c.darker_black })

-- Cmp (blink.cmp)
hi("BlinkCmpMenu",          { fg = c.white, bg = c.darker_black })
hi("BlinkCmpMenuBorder",    { fg = c.grey, bg = c.darker_black })
hi("BlinkCmpMenuSelection", { bg = c.one_bg2 })
hi("BlinkCmpLabel",         { fg = c.white })
hi("BlinkCmpLabelMatch",    { fg = c.blue, bold = true })
hi("BlinkCmpKind",          { fg = c.blue })
hi("BlinkCmpDoc",           { fg = c.white, bg = c.darker_black })
hi("BlinkCmpDocBorder",     { fg = c.grey, bg = c.darker_black })

-- Flash
hi("FlashLabel",   { fg = c.black, bg = c.red, bold = true })
hi("FlashBackdrop", { fg = c.grey })
hi("FlashMatch",   { fg = c.white, bg = c.one_bg3 })
hi("FlashCurrent", { fg = c.black, bg = c.green })

-- Oil
hi("OilDir", { fg = c.blue })
hi("OilFile", { fg = c.white })

-- Todo comments
hi("TodoBgTODO", { fg = c.black, bg = c.blue, bold = true })
hi("TodoBgFIX",  { fg = c.black, bg = c.baby_pink, bold = true })
hi("TodoBgHACK", { fg = c.black, bg = c.orange, bold = true })
hi("TodoBgWARN", { fg = c.black, bg = c.yellow, bold = true })
hi("TodoBgNOTE", { fg = c.black, bg = c.cyan, bold = true })
hi("TodoBgPERF", { fg = c.black, bg = c.purple, bold = true })
hi("TodoFgTODO", { fg = c.blue })
hi("TodoFgFIX",  { fg = c.baby_pink })
hi("TodoFgHACK", { fg = c.orange })
hi("TodoFgWARN", { fg = c.yellow })
hi("TodoFgNOTE", { fg = c.cyan })
hi("TodoFgPERF", { fg = c.purple })

-- Terminal colors ─────────────────────────────────────────────────────────────
vim.g.terminal_color_0  = c.black
vim.g.terminal_color_1  = c.baby_pink
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.pink
vim.g.terminal_color_6  = c.cyan
vim.g.terminal_color_7  = c.white
vim.g.terminal_color_8  = c.grey
vim.g.terminal_color_9  = c.baby_pink
vim.g.terminal_color_10 = c.vibrant_green
vim.g.terminal_color_11 = c.sun
vim.g.terminal_color_12 = c.blue
vim.g.terminal_color_13 = c.pink
vim.g.terminal_color_14 = c.teal
vim.g.terminal_color_15 = c.bright_white
