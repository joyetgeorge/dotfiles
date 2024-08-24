local map = vim.keymap.set

local function pick_dropbar()
  require('dropbar.api').pick()
end

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>')
map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
map('n', '<leader>e', '<CMD>:NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
map('n', '<leader>dp', pick_dropbar, { desc = 'Dropbar Pick' })
map({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
map({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
map({ 'n', 'x', 'o' }, 'ls', '<Plug>(leap-from-window)')
