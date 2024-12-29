return {
  "hrsh7th/nvim-cmp",
  dependencies = {

    {
      "supermaven-inc/supermaven-nvim",
      opts = {},
    },
    {
      "hrsh7th/cmp-cmdline",
      event = "CmdlineEnter",
      config = function()
        local cmp = require "cmp"

        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = "buffer" } },
        })
      end,
    },
  },

  opts = function(_, opts)
    opts.sources[1].trigger_characters = { "-" }
    table.insert(opts.sources, 1, { name = "supermaven" })
  end,
}
