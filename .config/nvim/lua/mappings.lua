require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Option+Backspace to delete word backward
map("i", "<A-BS>", "<C-w>", { desc = "Delete word backward" })
map("c", "<A-BS>", "<C-w>", { desc = "Delete word backward in command line" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
