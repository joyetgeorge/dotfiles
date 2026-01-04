-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "everblush",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  statusline = {
    theme = "vscode_colored",
    separator_style = "block"
  },
  tabufline = {
    modules = {
      git_changes = function()
        -- Set custom highlight for git changes
        vim.api.nvim_set_hl(0, "TabuflineGitChanges", { fg = "#4D78CC", bold = true })
        local result = vim.fn.system("git status --porcelain 2>/dev/null | wc -l | tr -d ' '")
        local count = tonumber(result) or 0
        if count > 0 then
          return "%#TabuflineGitChanges#  " .. count .. " "
        end
        return ""
      end,
    },
    order = { "treeOffset", "buffers", "tabs", "git_changes", "btns" },
  },
}

return M
