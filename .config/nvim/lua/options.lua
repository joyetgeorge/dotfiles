local opt = vim.opt
local o = vim.o

-- General
o.mouse = "a"
o.clipboard = "unnamedplus"
o.showmode = false
o.laststatus = 3
o.cursorline = true

-- Line numbers
o.number = true
o.relativenumber = true

-- Tabs & indentation
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true

-- Search
o.ignorecase = true
o.smartcase = true

-- Splits
o.splitbelow = true
o.splitright = true

-- Performance
o.updatetime = 250
o.timeoutlen = 800
o.redrawtime = 1500
opt.synmaxcol = 300

-- Display
o.termguicolors = true
o.pumblend = 10
o.signcolumn = "yes"
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 36

-- Files
o.undofile = true
o.swapfile = false

-- Folding
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.foldcolumn = "0"
o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep:│,foldclose:▸]]
o.statuscolumn = '%s%=%{%v:relnum == 0 ? "%#CursorLineNr#" : ""%}%l %{%v:relnum == 0 ? "%#CursorLineFold#" : "%#FoldColumn#"%}%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "▾ " : "▸ ") : foldlevel(v:lnum) > 0 ? "│ " : "  "}%*'

-- Misc
opt.shortmess:append("sI")
opt.whichwrap:append("<>[]hl")
