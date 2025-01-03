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

--vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
--vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle nvim-tree' })
vim.keymap.set('n', 'e', '<Cmd>NvimTreeFocus<CR>', { desc = 'Toggle nvim-tree' })

map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Find files' })
map('n', '<leader>fl', ':Telescope live_grep<CR>', { desc = 'Find text' })
map('n', '<leader>fb', ':Telescope buffers<CR>', { desc = 'Find buffers' })
map('n', '<leader>fh', ':Telescope help_tags<CR>', { desc = 'Find help' })
map('n', '<leader>fo', ':Telescope oldfiles<CR>', { desc = 'Find old files' })
map('n', '<leader>fm', ':Telescope marks<CR>', { desc = 'Find marks' })
map('n', '<leader>fr', ':Telescope registers<CR>', { desc = 'Find registers' })
map('n', '<leader>fs', ':Telescope spell_suggest<CR>', { desc = 'Find spell' })
map('n', '<leader>fp', ':Telescope projects<CR>', { desc = 'Find projects' })
map('n', '<leader>fg', ':Telescope git_status<CR>', { desc = 'Git status' })
map('n', '<leader>ft', ':Telescope file_browser<CR>', { desc = 'Git status' })
