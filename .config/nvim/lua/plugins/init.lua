return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- FZF native for faster telescope sorting
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
    config = function()
      pcall(require("telescope").load_extension, "fzf")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "storybook%-static/", "node_modules/", "%.git/",
          "dist/", "build/", "%.next/", "%.nuxt/", "coverage/",
          "%.cache/", "%.turbo/", "%.vercel/", "%.output/",
          "__pycache__/", "%.pytest_cache/", "venv/", "%.venv/",
          "target/", "vendor/", "%.lock$", "package%-lock%.json$",
          "yarn%.lock$", "pnpm%-lock%.yaml$", "%.min%.js$",
          "%.min%.css$", "%.map$", "%.chunk%.js$",
        },
        sorting_strategy = "descending",
        layout_config = {
          horizontal = { prompt_position = "bottom", preview_width = 0.5 },
        },
        vimgrep_arguments = {
          "rg", "--color=never", "--no-heading", "--with-filename",
          "--line-number", "--column", "--smart-case", "--hidden",
          "--trim", "--max-columns=200", "--max-columns-preview",
          "--glob=!.git/*", "--glob=!node_modules/*",
        },
        path_display = { "truncate" },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = {
            "/opt/homebrew/bin/fd", "--type", "f", "--strip-cwd-prefix", "--hidden",
            "--exclude", ".git", "--exclude", "node_modules",
            "--exclude", "dist", "--exclude", "build", "--exclude", ".next",
          },
        },
        buffers = { sort_lastused = true, sort_mru = true },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "markdown", "markdown_inline",
        "javascript", "typescript", "tsx", "json",
      },
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then return true end
          if vim.api.nvim_buf_line_count(buf) > 5000 then return true end
          return false
        end,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then return true end
          return false
        end,
      },
    },
  },
}
