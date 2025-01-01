require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- plugin
-- map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>e", "<CMD>:NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

map("n", "K", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = "Show diagnostics" })

map("n", "m", function()
  vim.lsp.buf.hover()
end, { desc = "Peek definition" })

-- map("n", "-", function()
--   require("mini.files").open()
-- end, { desc = "Peek definition" })
--
map("i", "jk", "<ESC>")

vim.api.nvim_set_keymap('i', '<M-BS>', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<M-BS>', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<M-BS>', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<D-BS>', '<Esc>ddi', { noremap = true, silent = true })

vim.keymap.set("n", '<leader>w', function()
  vim.cmd("vsplit | wincmd l")
  require("oil").open()
end)

vim.keymap.set('n', '<leader>sF', function()
  require('telescope.builtin').spell_suggest(
    require('telescope.themes').get_cursor({
      attach_mappings = function(_, map)
        map({ 'i', 'n' }, '<C-y>', require('telescope.actions').select_default)
        return true
      end,
    })
  )
end, { desc = 'Spelling Suggestions' })

vim.keymap.set("n", "<space>fs", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

vim.api.nvim_set_keymap("n", "-", "<cmd>lua require('oil').open_float('.')<CR>", { noremap = true, silent = true })
