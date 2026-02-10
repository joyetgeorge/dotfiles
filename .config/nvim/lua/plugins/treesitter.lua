return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "markdown", "markdown_inline",
        "javascript", "typescript", "tsx", "json",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)

      -- Enable treesitter highlighting (now built into Neovim)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
          if ok and stats and stats.size > max_filesize then return end
          if vim.api.nvim_buf_line_count(args.buf) > 5000 then return end
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      -- Enable treesitter-based indentation
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = { ["]m"] = "@function.outer" },
          goto_next_end = { ["]M"] = "@function.outer" },
          goto_previous_start = { ["[m"] = "@function.outer" },
          goto_previous_end = { ["[M"] = "@function.outer" },
        },
      })
    end,
  },
}
