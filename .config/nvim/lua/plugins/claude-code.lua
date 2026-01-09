return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("claude-code").setup({
      -- Window settings
      window = {
        position = "float",
        enter_insert = true,
        float_opts = {
          width = 0.8,
          height = 0.8,
          border = "rounded",
        },
      },
      -- Git integration
      git = {
        enabled = true,
        use_git_root = true,
      },
      -- Keymaps
      keymaps = {
        toggle = {
          normal = "<C-,>",
          terminal = "<C-,>",
        },
        window_navigation = true,
        scrolling = true,
      },
    })
  end,
  keys = {
    { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
    { "<leader>cC", "<cmd>ClaudeCodeContinue<cr>", desc = "Continue Claude Code" },
  },
}
