-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_wayland = false

-- This is where you actually apply your config choices

config.font = wezterm.font("JetBrains Mono")
config.font_size = 10

config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"
config.color_scheme = "nordfox"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500

config.window_background_opacity = 0.9

-- and finally, return the configuration to wezterm
return config
