return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
  end,
  keys = {
    {
      "<leader>ll",
      function()
        local new = not vim.diagnostic.config().virtual_lines
        vim.diagnostic.config({ virtual_lines = new, virtual_text = not new })
      end,
      desc = "Toggle lsp_lines",
    },
  },
}
