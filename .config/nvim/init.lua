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
end
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

vim.cmd.colorscheme 'everforest'

require 'theme'

vim.opt.termguicolors = true

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'NvimTree',
  callback = function()
    vim.cmd [[
      highlight NvimTreeEndOfBuffer guifg=#1C1E26 guibg=NONE
      highlight WinSeparator guifg=#282c34 guibg=NONE
      highlight NvimTreeFolderIcon guifg=#26BBD9 guibg=NONE
    ]]
  end,
})
