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
config.window_decorations = "NONE"
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

-- Key Bindings
config.keys = {
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

return config
