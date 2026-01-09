return {
  -- Fugitive: Git commands in Vim
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git status (Fugitive)" },
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
      { "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "Git log" },
    },
  },

  -- Neogit: Magit-style Git UI
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gn", "<cmd>Neogit kind=split<cr>", desc = "Neogit (split)" },
      { "<leader>gN", "<cmd>Neogit kind=tab<cr>", desc = "Neogit (fullscreen)" },
      { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit commit" },
      { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Neogit push" },
      { "<leader>gP", "<cmd>Neogit pull<cr>", desc = "Neogit pull" },
    },
    opts = {
      integrations = {
        diffview = true,
        telescope = true,
      },
      signs = {
        section = { "", "" },
        item = { "", "" },
      },
      graph_style = "unicode",
      kind = "split",
      status = {
        recent_commit_count = 10,
      },
      commit_editor = {
        kind = "split",
      },
      highlight = {
        italic = false,
        bold = true,
      },
    },
    config = function(_, opts)
      -- Set Neogit diff colors before loading (all variants same color for consistency)
      vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "#2d4a3e", fg = "#89d185" })
      vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { bg = "#2d4a3e", fg = "#89d185" })
      vim.api.nvim_set_hl(0, "NeogitDiffAddCursor", { bg = "#3a5a4a", fg = "#89d185" })
      vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "#4d2a2d", fg = "#f48771" })
      vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = "#4d2a2d", fg = "#f48771" })
      vim.api.nvim_set_hl(0, "NeogitDiffDeleteCursor", { bg = "#5d3a3d", fg = "#f48771" })
      vim.api.nvim_set_hl(0, "NeogitDiffContext", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { bg = "NONE" })

      -- File status change type highlights
      vim.api.nvim_set_hl(0, "NeogitChangeDeleted", { fg = "#f48771", bold = true })
      vim.api.nvim_set_hl(0, "NeogitChangeModified", { fg = "#e5c07b", bold = true })
      vim.api.nvim_set_hl(0, "NeogitChangeAdded", { fg = "#89d185", bold = true })
      vim.api.nvim_set_hl(0, "NeogitChangeRenamed", { fg = "#7aa2f7", bold = true })
      vim.api.nvim_set_hl(0, "NeogitChangeCopied", { fg = "#c678dd", bold = true })
      vim.api.nvim_set_hl(0, "NeogitChangeUntracked", { fg = "#e5c07b" })
      
      require("neogit").setup(opts)

      -- Add keymap in Neogit buffers to switch to fullscreen
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "Neogit*",
        callback = function()
          vim.keymap.set("n", "<leader>gN", function()
            require("neogit").close()
            vim.schedule(function()
              require("neogit").open({ kind = "tab" })
            end)
          end, { buffer = true, desc = "Neogit fullscreen" })
        end,
      })
    end,
  },

  -- Diffview: File diffs and history
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
      { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
    },
    config = function()
      -- VS Code-style diff colors
      local function set_vscode_diff_colors()
        -- Added lines: green background (VS Code style)
        vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2d4a3e" })
        vim.api.nvim_set_hl(0, "DiffText", { bg = "#3d5a4e" })
        -- Deleted lines: red background (VS Code style)
        vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#4d2a2d", fg = "#6e3b3e" })
        -- Changed lines: subtle blue/cyan
        vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2d3a4a" })

        -- Diffview specific highlights
        vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#4d2a2d" })
        vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { fg = "#6e3b3e" })

        -- Neogit specific highlights (VS Code style)
        vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "#2d4a3e", fg = "#89d185" })
        vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { bg = "#3d5a4e", fg = "#a3e097" })
        vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "#4d2a2d", fg = "#f48771" })
        vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = "#6d3a3d", fg = "#ff9999" })
        vim.api.nvim_set_hl(0, "NeogitDiffContext", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { bg = "#1e2030" })
        vim.api.nvim_set_hl(0, "NeogitHunkHeader", { bg = "#2d3a4a", fg = "#7aa2f7" })
        vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", { bg = "#3d4a5a", fg = "#7aa2f7" })
      end

      set_vscode_diff_colors()

      -- Reapply after colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_vscode_diff_colors,
      })

      require("diffview").setup({
        enhanced_diff_hl = true,
        view = {
          default = {
            layout = "diff2_horizontal",
          },
          merge_tool = {
            layout = "diff3_mixed",
          },
        },
        file_panel = {
          win_config = {
            position = "left",
            width = 35,
          },
        },
      })
    end,
  },

  -- Git Worktree: Manage git worktrees with Telescope
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>gw", function() require("telescope").extensions.git_worktree.git_worktrees() end, desc = "Git worktrees" },
      { "<leader>gW", function() require("telescope").extensions.git_worktree.create_git_worktree() end, desc = "Create worktree" },
    },
    config = function()
      require("git-worktree").setup()
      require("telescope").load_extension("git_worktree")
    end,
  },

  -- Gitsigns: Enhanced configuration (NvChad includes basic version)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = "eol",
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]h", gs.next_hunk, { desc = "Next hunk" })
        map("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
        map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "Stage hunk" })
        map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "Reset hunk" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>hb", function() gs.blame_line { full = true } end, { desc = "Blame line" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
        map("n", "<leader>hD", function() gs.diffthis("~") end, { desc = "Diff this ~" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })
      end,
    },
  },
}
