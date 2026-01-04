return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- (“github/copilot.vim” may also be required, depending on your setup)
    },
    opts = {
      debug = true,
      show_help = true,
      window = {
        layout = "float",
      },
      auto_follow_cursor = false,
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      -- Example commands:
      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        require("CopilotChat").ask(args.args, { selection = require("CopilotChat.select").visual })
      end, { nargs = "*", range = true })
    end,
  },
}

