require("nvchad.configs.lspconfig").defaults()

local on_attach = function(client, bufnr)
  -- Add any custom on_attach functionality here
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Server configurations with correct command names
local server_configs = {
  tsserver = {
    name = "tsserver",
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
    root_dir = function()
      local root = vim.fs.find({
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
      }, { upward = true })[1]
      return root and vim.fs.dirname(root) or vim.fn.getcwd()
    end
  },
  html = {
    name = "html",
    cmd = { "vscode-html-language-server", "--stdio" }
  },
  cssls = {
    name = "cssls",
    cmd = { "vscode-css-language-server", "--stdio" }
  },
  jsonls = {
    name = "jsonls",
    cmd = { "vscode-json-language-server", "--stdio" }
  }
}

-- Start each server with its configuration
for name, config in pairs(server_configs) do
  config.capabilities = capabilities
  config.on_attach = on_attach
  
  local ok, err = pcall(vim.lsp.start, config)
  if not ok then
    vim.notify("Failed to start " .. name .. ": " .. err, vim.log.levels.WARN)
  end
end

-- read :h vim.lsp.config for changing options of lsp servers 
