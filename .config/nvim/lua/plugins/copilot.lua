return {
  "github/copilot.vim",
  lazy = false,
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end,
}

