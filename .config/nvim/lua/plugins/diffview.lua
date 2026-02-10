return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  keys = {
    { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
  },
  config = function()
    local function set_vscode_diff_colors()
      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2d4a3e" })
      vim.api.nvim_set_hl(0, "DiffText", { bg = "#3d5a4e" })
      vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#4d2a2d", fg = "#6e3b3e" })
      vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2d3a4a" })
      vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#4d2a2d" })
      vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { fg = "#6e3b3e" })
      vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "#2d4a3e", fg = "#89d185" })
      vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { bg = "#3d5a4e", fg = "#a3e097" })
      vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "#4d2a2d", fg = "#f48771" })
      vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = "#6d3a3d", fg = "#ff9999" })
      vim.api.nvim_set_hl(0, "NeogitDiffContext", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { bg = "#1e2030" })
      vim.api.nvim_set_hl(0, "NeogitHunkHeader", { bg = "#2d3a4a", fg = "#7aa2f7" })
      vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", { bg = "#3d4a5a", fg = "#7aa2f7" })
    end

    set_vscode_diff_colors()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_vscode_diff_colors })

    require("diffview").setup({
      enhanced_diff_hl = true,
      view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = { layout = "diff3_mixed" },
      },
      file_panel = {
        win_config = { position = "left", width = 35 },
      },
    })
  end,
}
