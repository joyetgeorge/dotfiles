-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
  ui = {
    statusline = {
      theme = "minimal",
      separator_style = "arrow",
      order = nil,
      modules = nil,
    },
    cmp = {
      enabled = true,
      icons = true,
      style = "atom_colored",
    },
  },
}

M.base46 = {
  theme = "gruvchad",
  changed_themes = {
    all = {
      base_16 = {},
      base_30 = {}
    },
    onedark = {
      base_30 = {
        one_bg = "#282c34",
      },
    },
  },
}

return M
