return {
  "stevearc/oil.nvim",
  lazy = false,
  config = function()
    require("oil").setup({
      keymaps = {
        ["gy"] = {
          desc = "Copy file path",
          callback = function()
            local oil = require("oil")
            local entry = oil.get_cursor_entry()
            if entry then
              local dir = oil.get_current_dir()
              local path = dir .. entry.name
              local short_path = vim.fn.fnamemodify(path, ":~")
              vim.fn.setreg("+", short_path)
              vim.notify("Copied: " .. short_path)
            end
          end,
        },
      },
    })
    vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory (Oil)" })
    vim.keymap.set("n", "+", function()
      require("oil").open(vim.fn.getcwd())
    end, { desc = "Open Oil in CWD" })
  end,
}
