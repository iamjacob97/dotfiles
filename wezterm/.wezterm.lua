local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.initial_cols = 139
config.initial_rows = 33

config.color_scheme = "Kanagawa (Gogh)"
config.font_size = 11

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_padding = {
	left = "0.9cell",
	right = "0.9cell",
	top = "0.3cell",
	bottom = "0.3cell",
}
config.window_background_opacity = 0.97
config.text_background_opacity = 0.97

return config
