return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle NvimTree" },
  },
  opts = {
    view = {
      side = "right",
      width = 40,
    },
    hijack_cursor = true,
    renderer = {
      root_folder_label = false,
      highlight_opened_files = "name",
      icons = {
        show = { folder_arrow = false },
        glyphs = {
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "\u{f07b}",
            open = "\u{f07c}",
            empty = "\u{f114}",
            empty_open = "\u{f115}",
            symlink = "\u{f0c1}",
            symlink_open = "\u{f0c1}",
          },
          git = {
            unstaged = "\u{f00d}",
            staged = "\u{f00c}",
            unmerged = "\u{f06a}",
            renamed = "\u{f061}",
            untracked = "\u{f005}",
            deleted = "\u{f014}",
            ignored = "\u{f10c}",
          },
        },
      },
    },
  },
}
