return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup()

    local map = vim.keymap.set
    map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
    map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
    map("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
    map("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
    map("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
    map("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
  end,
}
