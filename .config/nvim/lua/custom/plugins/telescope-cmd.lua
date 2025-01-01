return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'jonarrien/telescope-cmdline.nvim',
  },
  keys = {
    { 'Q', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
    { '<leader><leader>', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
  },
  opts = {
    extensions = {
      cmdline = {},
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension 'cmdline'
  end,
}
