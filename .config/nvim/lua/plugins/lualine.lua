return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local custom_theme = require("lualine.themes.auto")
    custom_theme.normal.a = { bg = custom_theme.normal.a.bg, fg = "#18B06A", gui = "bold" }
    custom_theme.insert.a = { bg = "#18B06A", fg = "#000000", gui = "bold" }

    require("lualine").setup({
      options = {
        theme = custom_theme,
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", icon = "󰊠" },
        },
        lualine_b = {
          { "branch", icon = "" },
          {
            "diff",
            symbols = { added = "+ ", modified = "~ ", removed = "- " },
          },
        },
        lualine_c = {
          { function() return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") end, icon = "󰉋", color = { fg = "#61716E" } },
          { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
          { "filename", symbols = { modified = " ●", readonly = " 󰌾", unnamed = "[No Name]", newfile = " " }, color = { fg = "#61716E" } },
        },
        lualine_x = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
          },
          { "filetype", icon_only = false },
        },
        lualine_y = { { "progress", icon = "󰦨" } },
        lualine_z = { { "location", icon = "" } },
      },
    })
  end,
}
