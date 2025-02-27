local colors = {
  hilight = '#c3646b',
  bg_dark = '#2D3639',
  bg_light = '#2e383c',
  bg_default = '#2D3639',
}

vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = colors.bg_light, bg = colors.bg_light })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = colors.hilight, bg = colors.bg_light })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = colors.hilight, bg = colors.bg_light })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = colors.bg_light, bg = colors.bg_light })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = colors.hilight })

vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = colors.bg_default, bg = colors.bg_default })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = colors.bg_default, bg = colors.bg_default })
vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = colors.bg_default })

vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = colors.bg_dark, bg = colors.bg_dark })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = colors.bg_dark, bg = colors.bg_dark })
vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { fg = colors.hilight, bg = colors.bg_dark })

vim.api.nvim_set_hl(0, 'htmlTag', { fg = '#E5C07B' })
vim.api.nvim_set_hl(0, 'htmlTagName', { fg = '#db887a' })
