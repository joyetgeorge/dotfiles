-- No plugin needed — scaryforest is a local colorscheme in colors/scaryforest.lua
return {
  "nvim-lua/plenary.nvim",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("scaryforest")
  end,
}
