vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

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
  { import = 'custom.plugins' },
}

require 'mappings'
require 'setup'
require 'opts'

vim.cmd.colorscheme 'onedark'

require 'theme'

vim.opt.termguicolors = true
require('bufferline').setup {
  highlights = {
    fill = {
      fg = '#1e222a',
      bg = '#1e222a',
    },
    background = {
      bg = '#1e222a',
    },
    close_button = {
      bg = '#1e222a',
    },
    modified = {
      bg = '#1e222a',
    },
    pick_visible = {
      bg = '#1e222a',
    },
    pick = {
      bg = '#1e222a',
    },
    separator = {
      bg = '#1e222a',
    },
  },
}
