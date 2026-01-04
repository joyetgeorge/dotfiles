return {
  "stevearc/oil.nvim",
  lazy = false,
  config = function()
    require("oil").setup()
    vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory (Oil)" })
    vim.keymap.set("n", "+", function()
      require("oil").open(vim.fn.getcwd())
    end, { desc = "Open Oil in CWD" })
  end,
}
