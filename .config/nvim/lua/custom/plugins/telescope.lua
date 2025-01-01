return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        file_browser = {
          dir_icon = '',
          dir_icon_hl = 'MiniIconsBlue',
        },
        cmdline = {
          -- Adjust telescope picker size and layout
          picker = {
            layout_config = {
              width = 120,
              height = 25,
            },
          },
          -- Adjust your mappings
          mappings = {
            complete = '<Tab>',
            run_selection = '<Enter>',
            run_input = '<CR>',
          },
          -- Triggers any shell command using overseer.nvim (`:!`)
          overseer = {
            enabled = true,
          },
        },
      },
    }
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension 'file_browser')
  end,
}
