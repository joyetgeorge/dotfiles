require "nvchad.options"

local o = vim.o
local opt = vim.opt

-- Performance options
o.updatetime = 250
o.timeoutlen = 400
o.redrawtime = 1500
opt.synmaxcol = 300
o.foldmethod = "manual"
o.foldlevelstart = 99
