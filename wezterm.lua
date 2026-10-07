-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_wayland = true

-- This is where you actually apply your config choices

config.font = wezterm.font("Fira Code")
config.font_size = 7.9

config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"
config.color_scheme = "nordfox"

config.window_padding = {
	left = 1,
	right = 1,
	top = 1,
	bottom = 1,
}

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500

config.window_background_opacity = 0.8
config.wayland_window_background_blur = true

-- and finally, return the configuration to wezterm
return config
