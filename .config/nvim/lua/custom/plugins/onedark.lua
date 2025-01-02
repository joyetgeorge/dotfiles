return {
  'olimorris/onedarkpro.nvim',
  priority = 1000,
  config = function()
    require('onedarkpro').setup {
      theme = 'onedark',
      colors = {
        bg = '#1e222a',
      },
    }
  end,
}
