return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = true,
      disable = {},
    },
    autotag = {
      enable = true,
    },
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "tsx",
      "typescript",
      "javascript",
    },
    playground = {
      enable = true,
      updatetime = 25,
      persist_queries = false,
    },
  },
}
