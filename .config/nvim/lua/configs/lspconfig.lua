require("nvchad.configs.lspconfig").defaults()

-- Valid LSP servers only
local servers = { "html", "cssls", "ts_ls", "mdx_analyzer", "graphql", "jsonls" }

vim.lsp.enable(servers)

-- ESLint LSP with flat config support (ESLint 9)
vim.lsp.config("eslint", {
  settings = {
    eslint = {
      experimental = {
        useFlatConfig = true,
      },
      workingDirectories = { mode = "auto" },
    },
  },
})
vim.lsp.enable("eslint")
