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

    dashboard.section.buttons.val = {}

    dashboard.section.footer.val = 'jogeo.'

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
    }

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      desc = 'Add Alpha dashboard footer',
      once = true,
      callback = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        dashboard.section.footer.val = { ' ', ' ', ' ', ' loaded ' .. stats.count .. ' plugins 󰆦 in ' .. ms .. ' ms ' }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    dashboard.section.header.opts.hl = 'DashboardHl'
    dashboard.section.footer.opts.hl = 'DashboardHlFooter'

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
