local wezterm = require("wezterm")

local config = {}

config.set_environment_variables = {
  COLORTERM="truecolor",
}
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font "FiraCode Nerd Font"
config.font_size = 10.5

return config
