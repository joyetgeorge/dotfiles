return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    _Gopts = {
      position = 'center',
      hl = 'Type',
      wrap = 'overflow',
    }

    dashboard.section.buttons.val = {
      dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '  Find file', ':cd $HOME | silent Telescope find_files hidden=true no_ignore=true <CR>'),
      dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
      dashboard.button('r', '󰄉  Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('u', '󱐥  Update plugins', '<cmd>Lazy update<CR>'),
      dashboard.button('c', '  Settings', ':e $HOME/.config/nvim/init.lua<CR>'),
      dashboard.button('p', '  Projects', ':e $HOME/Documents/github <CR>'),
      dashboard.button('d', '󱗼  Dotfiles', ':e $HOME/dotfiles <CR>'),
      dashboard.button('q', '󰿅  Quit', '<cmd>qa<CR>'),
    }

    dashboard.section.footer.val = 'jogeo.'

    dashboard.section.header.val = {
      '           ▄ ▄                   ',
      '       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ',
      '       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ',
      '    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ',
      '  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ',
      '  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄',
      '▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █',
      '█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █',
      '    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ',
    }

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      desc = 'Add Alpha dashboard footer',
      once = true,
      callback = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        dashboard.section.footer.val = { ' ', ' ', ' ', ' Loaded ' .. stats.count .. ' plugins  in ' .. ms .. ' ms ' }
        dashboard.section.header.opts.hl = 'DashboardFooter'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
