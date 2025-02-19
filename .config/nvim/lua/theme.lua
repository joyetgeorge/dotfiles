local colors = {
  hilight = '#a4435c',
  bg_dark = '#191A22',
  bg_light = '#1A1B23',
  bg_default = '#191A22',
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