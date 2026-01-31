require("nvchad.configs.lspconfig").defaults()

vim.lsp.set_log_level("WARN")

local lsp_flags = { debounce_text_changes = 150 }

vim.lsp.config("ts_ls", {
  flags = lsp_flags,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "none",
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayFunctionLikeReturnTypeHints = false,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "none",
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = false,
      },
    },
  },
})

vim.lsp.config("eslint", {
  flags = lsp_flags,
  settings = {
    eslint = {
      experimental = { useFlatConfig = true },
      workingDirectories = { mode = "auto" },
      run = "onSave",
    },
  },
})

local servers = { "html", "cssls", "ts_ls", "mdx_analyzer", "graphql", "jsonls", "gopls" }
vim.lsp.enable(servers)
vim.lsp.enable("eslint")

vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    severity = { min = vim.diagnostic.severity.WARN },
  },
  severity_sort = true,
})

