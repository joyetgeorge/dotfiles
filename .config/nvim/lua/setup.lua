require('oil').setup {
  show_hidden = true,
  delete_to_trash = true,
  preview = {
    win_options = {
      winhighlight = 'NormalFloat',
    },
  },
  confirmation = {
    border = 'rounded',
  },
  win_options = {
    winblend = 0,
  },
}

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = true,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = { 'node_modules' },
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    path_display = { 'truncate' },
    winblend = 0,
    border = {},
    color_devicons = true,
    borderchars = {
      '─', -- left
      '│', -- right
      '─', -- top
      '│', -- bottom
      '┌', -- top-left
      '┐', -- top-right
      '┘', -- bottom-right
      '└', -- bottom-left
    },
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
  },
}

require('cmp').setup {
  window = {
    completion = {
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local kind = require('lspkind').cmp_format { mode = 'symbol_text', maxwidth = 50 }(entry, vim_item)
      local strings = vim.split(kind.kind, '%s', { trimempty = true })
      kind.kind = ' ' .. (strings[1] or '') .. ' '
      kind.menu = ' (' .. (strings[2] or '') .. ')'

      kind.abbr = string.sub(vim_item.abbr, 1, 20)

      return kind
    end,
  },
}

-- MINI STATUSLINE

local blocked_filetypes = {
  ['man'] = true,
  ['dashboard'] = true,
  ['leetcode.nvim'] = true,
}

local MiniStatusline = require 'mini.statusline'

require('mini.statusline').setup {
  content = {
    active = function()
      local diag_signs = {
        ERROR = '%#DiagnosticError#󰄯 %#MiniStatuslineDevinfo#',
        WARN = '%#DiagnosticWarn#󰄯 %#MiniStatuslineDevinfo#',
        INFO = '%#DiagnosticInfo#󰄯 %#MiniStatuslineDevinfo#',
        HINT = '%#DiagnosticHint#󰄯 %#MiniStatuslineDevinfo#',
      }
      if blocked_filetypes[vim.bo.filetype] then
        vim.cmd 'highlight StatusLine guibg=NONE guifg=NONE'
        return ''
      end
      local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 75 }
      local git = MiniStatusline.section_git { trunc_width = 75 }
      local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75, signs = diag_signs }
      local filename = MiniStatusline.section_filename { trunc_width = 120 }
      local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
      local search = MiniStatusline.section_searchcount { trunc_width = 75 }
      return MiniStatusline.combine_groups {
        { hl = mode_hl, strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl, strings = { search } },
      }
    end,
  },
  use_icons = true,
}

-- IBL

vim.cmd [[ highlight NvimTreeGitNew guifg=#00FF00 ]]

require('ibl').setup {
  indent = {
    char = '▏',
  },
  scope = {
    show_start = false,
    show_end = false,
  },
}

local hooks = require 'ibl.hooks'
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)

-- TREE

require('nvim-tree').setup {
  view = {
    width = 35,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  renderer = {
    highlight_git = 'name',
    root_folder_label = false,
    icons = {
      git_placement = 'right_align',
      glyphs = {
        git = {
          unstaged = '󰬂',
          staged = '󱎤',
          unmerged = '󰬂󰫺',
          renamed = '󰫿',
          deleted = '󰫱',
          untracked = '󰬂󰬁',
          ignored = '󰫶',
        },
        folder = {
          arrow_closed = '󰅂',
          arrow_open = '󰅀',
          default = ' ',
          open = ' ',
          empty = ' ',
          empty_open = ' ',
        },
      },
    },
  },
}
