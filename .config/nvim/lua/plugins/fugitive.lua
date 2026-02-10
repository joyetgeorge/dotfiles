return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git status (Fugitive)" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
    { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
    { "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "Git log" },
  },
}
