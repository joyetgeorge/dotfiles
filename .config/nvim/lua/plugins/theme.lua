-- No plugin needed — scaryforest is a local colorscheme in colors/scaryforest.lua
-- Loaded here early via a dummy spec so it applies before other plugins
return {
  "nvim-lua/plenary.nvim", -- already a dependency of many plugins, harmless
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("scaryforest")
  end,
}
