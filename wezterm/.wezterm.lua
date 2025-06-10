local wezterm = require "wezterm"

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.initial_cols = 121
config.initial_rows = 27

config.color_scheme = "nightfox"
config.font_size = 11

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_padding = {
  left = '0.9cell',
  right = '0.9cell',
  top = '0.5cell',
  bottom = '0.5cell',
}
config.window_background_opacity = 0.97
config.text_background_opacity = 0.97

config.default_domain = "WSL:FedoraLinux-42"

return config
