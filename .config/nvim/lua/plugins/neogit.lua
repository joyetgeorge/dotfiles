return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gn", "<cmd>Neogit kind=split<cr>", desc = "Neogit (split)" },
    { "<leader>gN", "<cmd>Neogit kind=tab<cr>", desc = "Neogit (fullscreen)" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit commit" },
    { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Neogit push" },
    { "<leader>gP", "<cmd>Neogit pull<cr>", desc = "Neogit pull" },
  },
  opts = {
    integrations = {
      diffview = true,
      telescope = true,
    },
    signs = {
      section = { "", "" },
      item = { "", "" },
    },
    graph_style = "unicode",
    kind = "split",
    status = {
      recent_commit_count = 10,
    },
    commit_editor = {
      kind = "split",
    },
    highlight = {
      italic = false,
      bold = true,
    },
  },
  config = function(_, opts)
    vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "#2d4a3e", fg = "#89d185" })
    vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { bg = "#2d4a3e", fg = "#89d185" })
    vim.api.nvim_set_hl(0, "NeogitDiffAddCursor", { bg = "#3a5a4a", fg = "#89d185" })
    vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "#4d2a2d", fg = "#f48771" })
    vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = "#4d2a2d", fg = "#f48771" })
    vim.api.nvim_set_hl(0, "NeogitDiffDeleteCursor", { bg = "#5d3a3d", fg = "#f48771" })
    vim.api.nvim_set_hl(0, "NeogitDiffContext", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { bg = "NONE" })

    vim.api.nvim_set_hl(0, "NeogitChangeDeleted", { fg = "#f48771", bold = true })
    vim.api.nvim_set_hl(0, "NeogitChangeModified", { fg = "#e5c07b", bold = true })
    vim.api.nvim_set_hl(0, "NeogitChangeAdded", { fg = "#89d185", bold = true })
    vim.api.nvim_set_hl(0, "NeogitChangeRenamed", { fg = "#7aa2f7", bold = true })
    vim.api.nvim_set_hl(0, "NeogitChangeCopied", { fg = "#c678dd", bold = true })
    vim.api.nvim_set_hl(0, "NeogitChangeUntracked", { fg = "#e5c07b" })

    require("neogit").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "Neogit*",
      callback = function()
        vim.keymap.set("n", "<leader>gN", function()
          require("neogit").close()
          vim.schedule(function()
            require("neogit").open({ kind = "tab" })
          end)
        end, { buffer = true, desc = "Neogit fullscreen" })
      end,
    })
  end,
}
