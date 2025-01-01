local colors = {
  prompt_prefix_fg = '#e06c75',
  prompt_border_bg = '#252931',
  prompt_normal_fg = '#abb2bf',
  prompt_title_bg = '#1e222a',
  prompt_counter_fg = '#abb2bf',
  normal_bg = '#1b1f27',
  selection_fg = '#abb2bf',
  selection_bg = '#252931',
  results_title_fg = '#1b1f27',
  results_title_bg = '#1b1f27',
  diff_add_fg = '#98c379',
  diff_change_fg = '#e7c787',
  diff_delete_fg = '#e06c75',
  matching_fg = '#61afef',
  border_fg = '#1b1f27',
  border_bg = '#1b1f27',
  git_blame_fg = '#565c64',
  float_bg = '#1b1f27',
}

-- Prompt Highlights
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = colors.prompt_prefix_fg, bg = colors.prompt_border_bg })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = colors.prompt_border_bg, bg = colors.prompt_border_bg })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = colors.prompt_normal_fg, bg = colors.prompt_border_bg })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = colors.prompt_title_bg, bg = colors.prompt_prefix_fg })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = colors.prompt_counter_fg })

-- Normal and Selection
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = colors.normal_bg })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = colors.selection_fg, bg = colors.selection_bg })

-- Results
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = colors.results_title_fg, bg = colors.results_title_bg })
vim.api.nvim_set_hl(0, 'TelescopeResultsDiffAdd', { fg = colors.diff_add_fg })
vim.api.nvim_set_hl(0, 'TelescopeResultsDiffChange', { fg = colors.diff_change_fg })
vim.api.nvim_set_hl(0, 'TelescopeResultsDiffDelete', { fg = colors.diff_delete_fg })

-- Matching
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = colors.matching_fg, bg = '#282c34' })

-- Borders
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = colors.border_fg, bg = colors.border_bg })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = colors.border_fg, bg = colors.border_bg })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = colors.border_fg, bg = colors.border_bg })
vim.api.nvim_set_hl(0, 'GitBlameLine', { fg = colors.git_blame_fg })

-- Floating Window
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = colors.float_bg })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = colors.border_fg, bg = colors.border_bg })
