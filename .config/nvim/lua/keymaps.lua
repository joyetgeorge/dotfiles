local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear search highlights" })

-- Option+Backspace to delete word backward
map("i", "<A-BS>", "<C-w>", { desc = "Delete word backward" })
map("c", "<A-BS>", "<C-w>", { desc = "Delete word backward in command line" })

-- Save
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

-- Replace word under cursor
map("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Toggle comment (native gcc/gc in 0.10+)
map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })

-- Window navigation (C-h/j/k/l handled by tmux-navigator)
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Open in Finder
map("n", "<leader>of", function()
  local path
  if vim.bo.filetype == "oil" then
    path = require("oil").get_current_dir()
  else
    path = vim.fn.expand("%:p:h")
  end
  if path then
    vim.fn.system({ "open", path })
  end
end, { desc = "Open current folder in Finder" })

map("n", "<leader>oF", function()
  local path = vim.fn.expand("%:p")
  vim.fn.system({ "open", "-R", path })
end, { desc = "Reveal current file in Finder" })

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Exit terminal mode" })
