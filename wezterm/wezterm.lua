local wezterm = require("wezterm")

local config = {}

config.set_environment_variables = {
	COLORTERM = "truecolor",
}
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 11
config.colors = { cursor_bg = "#69F0AE" }

local function is_hyprland_running()
	local signature = os.getenv("HYPRLAND_INSTANCE_SIGNATURE")
	return signature ~= nil
end

if is_hyprland_running() then
	config.enable_wayland = false
end

return config
