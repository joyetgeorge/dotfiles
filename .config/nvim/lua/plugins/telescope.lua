return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Frecency (recent files)" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search keymaps" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search by grep" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Search diagnostics" },
    { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Search resume" },
    { "<leader>s.", "<cmd>Telescope oldfiles<cr>", desc = "Search recent files" },
    { "<leader>//", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy find in buffer" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "descending",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        file_ignore_patterns = {
          "storybook%-static/", "node_modules/", "%.git/",
          "dist/", "build/", "%.next/", "%.nuxt/", "coverage/",
          "%.cache/", "%.turbo/", "%.vercel/", "%.output/",
          "__pycache__/", "%.pytest_cache/", "venv/", "%.venv/",
          "target/", "vendor/", "%.lock$", "package%-lock%.json$",
          "yarn%.lock$", "pnpm%-lock%.yaml$", "%.min%.js$",
          "%.min%.css$", "%.map$", "%.chunk%.js$",
        },
        vimgrep_arguments = {
          "rg", "--color=never", "--no-heading", "--with-filename",
          "--line-number", "--column", "--smart-case", "--hidden",
          "--trim", "--max-columns=200", "--max-columns-preview",
          "--glob=!.git/*", "--glob=!node_modules/*",
        },
        path_display = { "truncate" },
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
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
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "frecency")
    pcall(require("telescope").load_extension, "ui-select")
  end,
}
