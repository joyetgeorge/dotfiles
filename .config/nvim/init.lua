vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { import = 'custom.plugins' },
}

require 'mappings'
require 'setup'
require 'opts'

vim.cmd.colorscheme 'terafox'

vim.o.laststatus = 3

vim.g.gitblame_highlight_group = 'GitBlameLine'

vim.cmd [[
  highlight TelescopeBorder guifg=#254147 guibg=#152528
  highlight TelescopePromptBorder guifg=#254147 guibg=#152528
  highlight TelescopeResultsBorder guifg=#254147 guibg=#152528
  highlight TelescopePreviewBorder guifg=#254147 guibg=#152528
  highlight GitBlameLine guifg=#152528 guibg=#254147
]]

vim.diagnostic.config {
  virtual_text = {
    prefix = ' ●',
    spacing = 2,
    format = function(diagnostic)
      return string.format('%s: %s ', diagnostic.severity, diagnostic.message)
    end,
  },
  signs = true,
  update_in_insert = false,
  severity_sort = true,
}

vim.g.lazygit_floating_window_border_chars = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
--vim.g.lazygit_floating_window_use_plenary = 1

vim.api.nvim_set_hl(0, 'LazyGitBorder', { fg = '#254147', bg = 'NONE' })
