return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
    side = "right",
    width = 40,
  },
    renderer = {
      icons = {
        show = {
          folder_arrow = false,
        },
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
