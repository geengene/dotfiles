-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}

-- This will hold the configuration.
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config = {
	automatically_reload_config = true,
	color_scheme = "Tokyo Night Moon",
	default_prog = { "C:/Program Files/Git/bin/bash.exe", "-l" },
	font = wezterm.font("JetBrainsMono Nerd Font"), --, { weight = "Bold" }
	window_decorations = "RESIZE",
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = false,
	tab_and_split_indices_are_zero_based = true,
}

-- and finally, return the configuration to wezterm
return config
