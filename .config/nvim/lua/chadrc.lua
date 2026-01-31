-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "scaryforest",

	hl_override = {
		["@variable"] = { fg = "#c0b382" },
		["@property"] = { fg = "#c0b382" },
		["@field"] = { fg = "#c0b382" },
		Identifier = { fg = "#c0b382" },
	},
}

-- Async cached git changes (avoids blocking UI in large repos)
local git_changes_cache = { count = 0, last_update = 0, cwd = "" }

local function update_git_changes_async()
  local cwd = vim.fn.getcwd()
  local now = vim.loop.now()
  if now - git_changes_cache.last_update < 5000 and cwd == git_changes_cache.cwd then
    return
  end
  git_changes_cache.last_update = now
  git_changes_cache.cwd = cwd
  vim.system({ "git", "status", "--porcelain" }, { cwd = cwd, text = true }, function(obj)
    if obj.code == 0 then
      local count = 0
      for _ in obj.stdout:gmatch("[^\n]+") do count = count + 1 end
      git_changes_cache.count = count
    else
      git_changes_cache.count = 0
    end
  end)
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "FocusGained" }, {
  callback = update_git_changes_async,
})
vim.schedule(update_git_changes_async)

-- M.nvdash = { load_on_startup = true }
M.ui = {
  statusline = {
    theme = "vscode_colored",
    separator_style = "block"
  },
  tabufline = {
    close_icon = "",
    modules = {
      git_changes = function()
        vim.api.nvim_set_hl(0, "TabuflineGitChanges", { fg = "#4D78CC", bold = true })
        if git_changes_cache.count > 0 then
          return "%#TabuflineGitChanges#  " .. git_changes_cache.count .. " "
        end
        return ""
      end,
    },
    order = { "treeOffset", "buffers", "tabs", "git_changes", "btns" },
  },
}

return M
