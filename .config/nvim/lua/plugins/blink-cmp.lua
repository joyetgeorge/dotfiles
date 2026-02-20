return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
  },
  version = "*",
  opts = {
    keymap = { preset = "default" },
    appearance = {
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      menu = {
        border = "none",
        scrollbar = false,
        draw = {
          columns = {
            { "kind_icon", gap = 1 },
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        window = { border = "padded" },
      },
      ghost_text = { enabled = true },
    },
    signature = { enabled = true },
    snippets = { preset = "luasnip" },
  },
}
