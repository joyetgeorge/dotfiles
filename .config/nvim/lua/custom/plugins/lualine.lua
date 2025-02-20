return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function git_changes_count()
      local output = vim.system({ 'git', 'status', '--porcelain' }, { text = true }):wait()
      local count = #vim.split(output.stdout or '', '\n', { trimempty = true })
      if count > 0 then
        return ' ' .. count
      end
      return ''
    end

    local function buffer_count()
      local buffers = vim.api.nvim_list_bufs()
      local count = 0
      for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
          count = count + 1
        end
      end
      return ' ' .. count -- "﬘" is a Nerd Font icon for buffers
    end

    require('lualine').setup {
      options = {
        theme = 'auto', -- You can change this to 'onedark', 'gruvbox', etc.
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { 'mode', icon = '' } },
        lualine_b = {
          {
            'branch',
            icon = '', -- Git branch icon
          },
          {
            'diff',
            symbols = {
              added = ' ', -- Added files (green)
              modified = ' ', -- Modified files (yellow)
              removed = ' ', -- Removed files (red)
            },
            color_added = 'Green',
            color_modified = 'Yellow',
            color_removed = 'Red',
          },
          'diagnostics',
          {
            git_changes_count,
            color = { fg = '#61afef' }, -- Blue color (OneDarkPro theme blue)
          },
        },
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = {
              modified = ' ●', -- Unsaved indicator
              readonly = ' ', -- Read-only indicator
              unnamed = '[No Name]',
            },
            color = function()
              if vim.bo.modified then
                local hl = vim.api.nvim_get_hl(0, { name = 'BufferCurrentMod', link = false })
                return hl and { fg = string.format('#%06x', hl.fg) } or { fg = '#E06C75' }
              end
            end,
          },
        },
        lualine_x = { buffer_count, 'encoding', 'filetype' },
        lualine_z = { 'location' },
      },
    }
  end,
}
