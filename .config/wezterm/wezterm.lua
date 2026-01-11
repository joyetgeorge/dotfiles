local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Appearance
-- config.color_scheme = 'ForestBlue' -- WezTerm might not have this exact name built-in
-- Manually setting background to match Ghostty's #121f1d
config.colors = {
  background = '#121f1d',
  -- You might want to populate other colors to match Forest Blue exactly
  -- using a palette if available.
}
config.font = wezterm.font 'JetBrains Mono'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.font_size = 14.2
config.line_height = 1.23

-- Cursor
config.default_cursor_style = 'SteadyBlock'
config.hide_mouse_cursor_when_typing = true

-- Window Settings
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 30,
  right = 30,
  top = 10,
  bottom = 3,
}

-- Tab Bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Shell Integration
config.default_prog = { '/bin/zsh', '-l' }

-- MacOS Option Key Behavior
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- Leader Key
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- Key Bindings
config.keys = {
  -- Activate Copy Mode
  {
    key = '[',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
  },
  -- MacOS standard word navigation
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
  -- Option+Backspace to delete word
  {
    key = 'Backspace',
    mods = 'OPT',
    action = wezterm.action.SendString '\x17',
  },
  -- Shift+Enter
  {
    key = 'Enter',
    mods = 'SHIFT',
    action = wezterm.action.SendString '\x1b\r',
  },
}

-- Key Tables
config.key_tables = {
  copy_mode = {
    -- Inherit default copy mode keybindings
    -- which includes h/j/k/l, w, b, e, etc.
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

    -- Enter y to copy and quit the copy mode
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

return config
