require "nvchad.autocmds"

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Large file performance optimizations
local large_file_group = vim.api.nvim_create_augroup("LargeFileOptimizations", { clear = true })
local large_file_size = 512 * 1024  -- 512 KB
local large_file_lines = 10000

vim.api.nvim_create_autocmd("BufReadPre", {
  group = large_file_group,
  callback = function(args)
    local ok, stats = pcall(vim.loop.fs_stat, args.file)
    if ok and stats and stats.size > large_file_size then
      vim.b[args.buf].large_file = true
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.undolevels = -1
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = large_file_group,
  callback = function(args)
    local is_large = vim.b[args.buf].large_file
    if not is_large then
      local line_count = vim.api.nvim_buf_line_count(args.buf)
      if line_count > large_file_lines then
        vim.b[args.buf].large_file = true
        is_large = true
      end
    end

    if is_large then
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
      vim.opt_local.list = false

      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
      if ok and stats and stats.size > (2 * 1024 * 1024) then
        vim.cmd("syntax clear")
        vim.opt_local.syntax = "off"
      end

      vim.schedule(function()
        local clients = vim.lsp.get_clients({ bufnr = args.buf })
        for _, client in ipairs(clients) do
          vim.lsp.buf_detach_client(args.buf, client.id)
        end
      end)

      vim.notify("Large file - some features disabled", vim.log.levels.WARN)
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = large_file_group,
  callback = function(args)
    if vim.b[args.buf].large_file then
      pcall(function() require("ibl").setup_buffer(args.buf, { enabled = false }) end)
      pcall(function() require("gitsigns").detach(args.buf) end)
    end
  end,
})

-- Auto-quit when NvimTree is the last window
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= "" then
        table.insert(floating_wins, w)
      end
    end
    if #wins - #floating_wins - #tree_wins == 1 then
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})
