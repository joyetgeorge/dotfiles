vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.relativenumber = true

vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { bg = '#1e222a' })

vim.o.laststatus = 3

vim.g.gitblame_highlight_group = 'GitBlameLine'

vim.g.lazygit_floating_window_border_chars = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
