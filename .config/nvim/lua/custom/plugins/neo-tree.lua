return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup {
      default_component_configs = {
        icon = {
          folder_closed = ' ',
          folder_open = ' ',
          folder_empty = ' ',
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        git_status = {
          symbols = {
            -- Change type
            added = 'A',
            modified = 'M',
            deleted = 'D',
            renamed = 'R',
            -- Status type
            untracked = 'U',
            ignored = '',
            unstaged = '󰄱',
            staged = '',
            conflict = '',
          },
        },
      },
    }
  end,
}
