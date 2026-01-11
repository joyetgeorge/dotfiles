require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Option+Backspace to delete word backward
map("i", "<A-BS>", "<C-w>", { desc = "Delete word backward" })
map("c", "<A-BS>", "<C-w>", { desc = "Delete word backward in command line" })

map("n", "<Esc><Esc>", function()
  local bufs = vim.fn.getbufinfo { buflisted = 1 }
  if #bufs <= 1 and (bufs[1] == nil or (bufs[1].name == "" and bufs[1].changed == 0)) then
    vim.cmd "qa"
  end
end, { desc = "Quit nvim if no buffer is open" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
