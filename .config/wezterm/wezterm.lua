local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Appearance
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 14.05
config.line_height = 1.30
config.allow_square_glyphs_to_overflow_width = 'WhenFollowedBySpace'

-- Transparency & Blur
config.window_background_opacity = 0.90
config.macos_window_background_blur = 50

-- Cursor
config.default_cursor_style = 'SteadyBlock'
config.hide_mouse_cursor_when_typing = true
config.cursor_thickness = 1

-- Colors (Scaryforest - matching Kitty)
config.colors = {
  background = '#121f1d',
  foreground = '#dde5e0',
  cursor_bg = '#3ec195',
  cursor_fg = '#1b1f28',
  selection_bg = '#4d4d4d',
  selection_fg = '#ffffff',

  ansi = {
    '#333333', -- black
    '#ab7d7d', -- red
    '#83aa7c', -- green
    '#c0b283', -- yellow
    '#77beb4', -- blue
    '#c993b5', -- magenta
    '#7ebdae', -- cyan
    '#dde5e0', -- white
  },
  brights = {
    '#4a4a4a', -- bright black
    '#9d6d6d', -- bright red
    '#78b573', -- bright green
    '#d0c191', -- bright yellow
    '#6ba89f', -- bright blue
    '#8c9f87', -- bright magenta
    '#88bdaa', -- bright cyan
    '#ecf4ef', -- bright white
  },

  tab_bar = {
    background = 'rgba(18, 31, 29, 0.9)',
    active_tab = {
      bg_color = 'rgba(18, 31, 29, 0.9)',
      fg_color = '#dde5e0',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = 'rgba(18, 31, 29, 0.9)',
      fg_color = '#3a4d47',
    },
    inactive_tab_hover = {
      bg_color = 'rgba(18, 31, 29, 0.9)',
      fg_color = '#606060',
    },
    new_tab = {
      bg_color = 'rgba(18, 31, 29, 0.9)',
      fg_color = '#3a4d47',
    },
    new_tab_hover = {
      bg_color = 'rgba(18, 31, 29, 0.9)',
      fg_color = '#606060',
    },
  },
}

-- Window Settings
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 3,
}

-- Split Colors
config.colors.split = '#354e47'
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.6,
}

-- Tab Bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_max_width = 25

-- Scrollback
config.scrollback_lines = 20000

-- Shell Integration
config.default_prog = { '/bin/zsh', '-l' }

-- MacOS Option Key Behavior
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- Leader Key (Ctrl+Space to match Kitty)
config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 2000 }

-- Key Bindings
config.keys = {
  -- Copy Mode (Scrollback)
  {
    key = '[',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
  },

  -- Search (Cmd+F)
  {
    key = 'f',
    mods = 'CMD',
    action = wezterm.action.Search 'CurrentSelectionOrEmptyString',
  },

  -- Splits
  -- Horizontal split (Top/Bottom)
  {
    key = '\\',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Vertical split (Side-by-Side)
  {
    key = "'",
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },

  -- Close Pane
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- Toggle Zoom Pane
  {
    key = 'Enter',
    mods = 'CMD|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },

  -- Pane Navigation
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },

  -- Cycle to next pane
  {
    key = 'o',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Next',
  },

  -- Interactive Pane Select
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.PaneSelect,
  },

  -- MacOS Word Navigation
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bb',
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf',
  },
  {
    key = 'Backspace',
    mods = 'OPT',
    action = wezterm.action.SendString '\x17',
  },
  {
    key = 'Backspace',
    mods = 'CMD',
    action = wezterm.action.SendString '\x17',
  },

  -- Shift+Enter
  {
    key = 'Enter',
    mods = 'SHIFT',
    action = wezterm.action.SendString '\x1b\r',
  },

  -- Jump to Tab (Cmd+1-9)
  { key = '1', mods = 'CMD', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'CMD', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'CMD', action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'CMD', action = wezterm.action.ActivateTab(3) },
  { key = '5', mods = 'CMD', action = wezterm.action.ActivateTab(4) },
  { key = '6', mods = 'CMD', action = wezterm.action.ActivateTab(5) },
  { key = '7', mods = 'CMD', action = wezterm.action.ActivateTab(6) },
  { key = '8', mods = 'CMD', action = wezterm.action.ActivateTab(7) },
  { key = '9', mods = 'CMD', action = wezterm.action.ActivateTab(8) },
}

-- Copy Mode Key Table
config.key_tables = {
  copy_mode = {
    { key = 'c', mods = 'CTRL', action = wezterm.action.CopyMode 'Close' },
    { key = 'g', mods = 'CTRL', action = wezterm.action.CopyMode 'Close' },
    { key = 'q', mods = 'NONE', action = wezterm.action.CopyMode 'Close' },
    { key = 'Escape', mods = 'NONE', action = wezterm.action.CopyMode 'Close' },

    { key = 'h', mods = 'NONE', action = wezterm.action.CopyMode 'MoveLeft' },
    { key = 'j', mods = 'NONE', action = wezterm.action.CopyMode 'MoveDown' },
    { key = 'k', mods = 'NONE', action = wezterm.action.CopyMode 'MoveUp' },
    { key = 'l', mods = 'NONE', action = wezterm.action.CopyMode 'MoveRight' },

    { key = 'LeftArrow', mods = 'NONE', action = wezterm.action.CopyMode 'MoveLeft' },
    { key = 'DownArrow', mods = 'NONE', action = wezterm.action.CopyMode 'MoveDown' },
    { key = 'UpArrow', mods = 'NONE', action = wezterm.action.CopyMode 'MoveUp' },
    { key = 'RightArrow', mods = 'NONE', action = wezterm.action.CopyMode 'MoveRight' },

    { key = 'RightArrow', mods = 'ALT', action = wezterm.action.CopyMode 'MoveForwardWord' },
    { key = 'f', mods = 'ALT', action = wezterm.action.CopyMode 'MoveForwardWord' },
    { key = '\t', mods = 'NONE', action = wezterm.action.CopyMode 'MoveForwardWord' },
    { key = 'w', mods = 'NONE', action = wezterm.action.CopyMode 'MoveForwardWord' },

    { key = 'LeftArrow', mods = 'ALT', action = wezterm.action.CopyMode 'MoveBackwardWord' },
    { key = 'b', mods = 'ALT', action = wezterm.action.CopyMode 'MoveBackwardWord' },
    { key = 'b', mods = 'NONE', action = wezterm.action.CopyMode 'MoveBackwardWord' },

    { key = '0', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToStartOfLine' },
    { key = 'Enter', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToStartOfNextLine' },

    { key = '$', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToEndOfLineContent' },
    { key = '$', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToEndOfLineContent' },
    { key = '^', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToStartOfLineContent' },
    { key = '^', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToStartOfLineContent' },
    { key = 'm', mods = 'ALT', action = wezterm.action.CopyMode 'MoveToStartOfLineContent' },

    { key = ' ', mods = 'NONE', action = wezterm.action.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'v', mods = 'NONE', action = wezterm.action.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'V', mods = 'SHIFT', action = wezterm.action.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'v', mods = 'CTRL', action = wezterm.action.CopyMode { SetSelectionMode = 'Block' } },

    { key = 'G', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToScrollbackBottom' },
    { key = 'G', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToScrollbackBottom' },
    { key = 'g', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToScrollbackTop' },

    { key = 'H', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToViewportTop' },
    { key = 'H', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToViewportTop' },
    { key = 'M', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToViewportMiddle' },
    { key = 'M', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToViewportMiddle' },
    { key = 'L', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToViewportBottom' },
    { key = 'L', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToViewportBottom' },

    { key = 'o', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToSelectionOtherEnd' },
    { key = 'O', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'O', mods = 'NONE', action = wezterm.action.CopyMode 'MoveToSelectionOtherEndHoriz' },

    { key = 'PageUp', mods = 'NONE', action = wezterm.action.CopyMode 'PageUp' },
    { key = 'PageDown', mods = 'NONE', action = wezterm.action.CopyMode 'PageDown' },

    { key = 'b', mods = 'CTRL', action = wezterm.action.CopyMode 'PageUp' },
    { key = 'f', mods = 'CTRL', action = wezterm.action.CopyMode 'PageDown' },

    -- y to copy and exit copy mode
    {
      key = 'y',
      mods = 'NONE',
      action = wezterm.action.Multiple {
        { CopyTo = 'ClipboardAndPrimarySelection' },
        { CopyMode = 'Close' },
      },
    },
  },
}

-- Startup Tabs (matching Kitty startup.session)
wezterm.on('gui-startup', function()
  local tabs = {
    { title = 'dev',      cwd = wezterm.home_dir .. '/Developer' },
    { title = 'dotfiles', cwd = wezterm.home_dir .. '/dotfiles' },
  }

  local first = tabs[1]
  local tab, pane, window = wezterm.mux.spawn_window {
    cwd = first.cwd,
  }
  tab:set_title(first.title)

  for i = 2, #tabs do
    local t, _ = window:spawn_tab { cwd = tabs[i].cwd }
    t:set_title(tabs[i].title)
  end

  -- Activate first tab
  window:gui_window():perform_action(wezterm.action.ActivateTab(0), pane)
end)

return config
