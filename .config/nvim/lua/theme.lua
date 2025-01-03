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

vim.api.nvim_set_hl(0, 'DashboardHl', { fg = colors.prompt_border_bg })
vim.api.nvim_set_hl(0, 'DashboardHlFooter', { fg = '#2C313C' })

-- Prompt Highlights
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = colors.prompt_prefix_fg, bg = colors.prompt_border_bg })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = colors.prompt_border_bg, bg = colors.prompt_border_bg })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = colors.prompt_normal_fg, bg = colors.prompt_border_bg })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = colors.prompt_border_bg, bg = colors.prompt_border_bg })
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

-- Customization for Pmenu
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#3E4451', fg = '#D7D7D7' })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#ABB2BF', bg = '#21252B' })

vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = '#7E8294', bg = 'NONE', strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = '#61AFEF', bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = '#61AFEF', bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = '#3E4451', bg = 'NONE', italic = true })

vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = '#E06C75', bg = '#3E4451' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = '#E06C75', bg = '#3E4451' })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = '#E06C75', bg = '#3E4451' })

vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = '#98C379', bg = '#3E4451' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = '#98C379', bg = '#3E4451' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = '#98C379', bg = '#3E4451' })

vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = '#D19A66', bg = '#3E4451' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = '#D19A66', bg = '#3E4451' })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = '#D19A66', bg = '#3E4451' })

vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = '#61AFEF', bg = '#2C313C' })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = '#61AFEF', bg = '#2C313C' })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#61AFEF', bg = '#2C313C' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = '#61AFEF', bg = '#2C313C' })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = '#61AFEF', bg = '#2C313C' })

vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = '#ABB2BF', bg = '#3E4451' })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = '#ABB2BF', bg = '#3E4451' })

vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = '#E5C07B', bg = '#3E4451' })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = '#E5C07B', bg = '#3E4451' })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = '#E5C07B', bg = '#3E4451' })

vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = '#61AFEF', bg = '#2C313C' })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = '#61AFEF', bg = '#2C313C' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = '#61AFEF', bg = '#2C313C' })

vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = '#56B6C2', bg = '#2C313C' })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = '#56B6C2', bg = '#2C313C' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = '#56B6C2', bg = '#2C313C' })

vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', { bg = '#282c34' })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeVisual', { bg = '#282c34' })

vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { bg = '#2f3541' })

vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = '#2f3541' })

vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = '#94979f' })

vim.api.nvim_set_hl(0, 'NvimTreeGitFileDirtyHL', { fg = '#d19a66' })

vim.api.nvim_set_hl(0, 'NvimTreeGitFileNewHL', { fg = '#98C379' })

vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = '#94979f' })

vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderIcon', { fg = '#61AFEF' })

vim.api.nvim_set_hl(0, 'NvimTreeClosedFolderIcon', { fg = '#61AFEF' })

vim.api.nvim_set_hl(0, 'NeoTreeMessage', { fg = '#3E4451' })

vim.api.nvim_set_hl(0, 'LazyGitBorder', { fg = '#31363f', bg = 'NONE' })
