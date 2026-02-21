return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local none = "NONE"
    local dark = "#0d1917"

    local scaryforest_nord = {
      normal = {
        a = { bg = none, fg = "#3ec195", gui = "bold" },
        b = { bg = none, fg = "#81a1c1" },
        c = { bg = none, fg = "#4c566a" },
      },
      insert = {
        a = { bg = "#3ec195", fg = dark, gui = "bold" },
        b = { bg = none, fg = "#88c0d0" },
      },
      visual = {
        a = { bg = "#b48ead", fg = dark, gui = "bold" },
        b = { bg = none, fg = "#b48ead" },
      },
      replace = {
        a = { bg = "#bf616a", fg = dark, gui = "bold" },
        b = { bg = none, fg = "#bf616a" },
      },
      command = {
        a = { bg = "#ebcb8b", fg = dark, gui = "bold" },
        b = { bg = none, fg = "#ebcb8b" },
      },
      inactive = {
        a = { bg = none, fg = "#3a4d47" },
        b = { bg = none, fg = "#3a4d47" },
        c = { bg = none, fg = "#3a4d47" },
      },
    }

    local function lsp_server_name()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then
        return ""
      end
      return clients[1].name
    end

    require("lualine").setup({
      options = {
        theme = scaryforest_nord,
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", icon = "󰊠" },
        },
        lualine_b = {
          { "branch", icon = "", color = { fg = "#3a4d47" } },
          {
            "diff",
            symbols = { added = "+ ", modified = "~ ", removed = "- " },
          },
        },
        lualine_c = {
          { function() return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") end, icon = "󰉋", color = { fg = "#3a4d47" } },
          { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
          { "filename", color = { fg = "#3a4d47" }, symbols = { modified = " ●", readonly = " 󰌾", unnamed = "[No Name]", newfile = " " } },
        },
        lualine_x = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
          },
          { lsp_server_name, icon = "󰆧 ", color = { fg = "#8fbcbb" } },
        },
        lualine_y = { { "progress", icon = "󰦨" } },
        lualine_z = { { "location", icon = "" } },
      },
    })
  end,
}
