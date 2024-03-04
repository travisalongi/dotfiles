-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font 'Fira Code'

-- For example, changing the color scheme:

-- config.color_scheme = 'Gruvbox dark, pale (base16)'
-- config.color_scheme = 'Google (light) (terminal.sexy)'
config.color_scheme = 'Grayscale Light (base16)'
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.color_scheme = 'GruvboxDarkHard'
config.color_scheme = 'nord-light'
config.color_scheme = 'Gruvbox Material (Gogh)'
config.exit_behavior = "Close"
config.window_close_confirmation = "NeverPrompt"


config.default_domain = 'WSL:Manjaro'
config.window_background_opacity = 0.97
config.hide_tab_bar_if_only_one_tab = true
config.line_height = 1.08
config.cell_width = 1.03
-- config.window_decorations = "NONE"

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'F11',
    action = wezterm.action.ToggleFullScreen,
  },
  {
  key = 'v',
  mods = 'CTRL',
  action = wezterm.action.PasteFrom "Clipboard"
  },
}

-- and finally, return the configuration to wezterm
return config
