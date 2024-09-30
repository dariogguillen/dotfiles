-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("Fira Code")
config.font_size = 10

config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"

config.colors = {
	background = "#232831",
	foreground = "#cdcecf",
	cursor_bg = "#cccccc",
	cursor_fg = "#000000",
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500

config.window_background_opacity = 0.95
-- config.macos_window_background_blur = 10

-- and finally, return the configuration to wezterm
return config
