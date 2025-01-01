local map = vim.keymap.set

local function pick_dropbar()
  require('dropbar.api').pick()
end

map('n', ';', ':Telescope cmdline<CR>', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>')
map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
map('n', '<leader>dp', pick_dropbar, { desc = 'Dropbar Pick' })
map({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
map({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
map({ 'n', 'x', 'o' }, 'ls', '<Plug>(leap-from-window)')
map('n', '<leader>/', function()
  require('Comment.api').toggle.linewise.current()
end, { noremap = true, silent = true })

--vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
--vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')
