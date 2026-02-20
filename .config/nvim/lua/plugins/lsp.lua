return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      -- LspAttach keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gd\\", function() vim.cmd("vsplit") vim.lsp.buf.definition() end, "Definition in vertical split")
          map("gd-", function() vim.cmd("split") vim.lsp.buf.definition() end, "Definition in horizontal split")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("gr", vim.lsp.buf.references, "References")
          map("gt", vim.lsp.buf.type_definition, "Go to type definition")
          map("<leader>ra", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "v" })
          map("<leader>lf", function() vim.diagnostic.open_float() end, "Floating diagnostic")
          map("[d", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")
          map("]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
          map("<leader>ls", vim.lsp.buf.signature_help, "Signature help")
        end,
      })

      -- Capabilities from blink.cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, blink = pcall(require, "blink.cmp")
      if ok then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      local servers = {
        html = {},
        cssls = {},
        somesass_ls = {},
        mdx_analyzer = {},
        graphql = {},
        jsonls = {},
        eslint = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
              },
              diagnostics = { globals = { "vim" } },
            },
          },
        },
      }

      require("mason-tool-installer").setup({
        ensure_installed = { "stylua" },
      })

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
