require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- plugin
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>e", "<CMD>:NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

map("n", "K", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = "Show diagnostics" })

map("n", "m", function()
  vim.lsp.buf.hover()
end, { desc = "Peek definition" })

map("i", "jk", "<ESC>")

vim.api.nvim_set_keymap('i', '<M-BS>', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<M-BS>', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<M-BS>', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<D-BS>', '<Esc>ddi', { noremap = true, silent = true })
