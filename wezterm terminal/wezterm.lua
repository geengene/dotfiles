-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- This will hold the configuration.
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

-- This is where you actually apply your config choices
config = {
	automatically_reload_config = true,
	color_scheme = "Tokyo Night Moon",
	default_prog = { "C:/Program Files/Git/bin/bash.exe", "-l" },
	default_domain = "WSL:Ubuntu",
	font = wezterm.font("JetBrainsMono Nerd Font"), --, { weight = "Bold" }
	window_decorations = "RESIZE",
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	window_background_opacity = 0.9,
	hide_tab_bar_if_only_one_tab = false,
	tab_and_split_indices_are_zero_based = true,
	window_close_confirmation = "NeverPrompt",
}

config.leader = { key = "a", mods = "ALT" }
config.keys = {
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "t",
		mods = "ALT|SHIFT",
		action = act.SpawnTab({
			DomainName = "WSL:Ubuntu",
		}),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "w",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ShowTabNavigator,
	},
	-- LEADER, followed by 'r' will put us in resize-pane
	-- mode until we cancel that mode.
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},

	-- LEADER, followed by 'a' will put us in activate-pane
	-- mode until we press some other key or until 1 second (1000ms)
	-- of time elapses
	-- {
	-- 	key = "a",
	-- 	mods = "LEADER",
	-- 	action = act.ActivateKeyTable({
	-- 		name = "activate_pane",
	-- 		timeout_milliseconds = 1000,
	-- 	}),
	-- },
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "f",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},
	{
		key = "s",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "activate_scroll",
			one_shot = false,
		}),
	},
}

config.key_tables = {
	-- Defines the keys that are active in our resize-pane mode.
	-- Since we're likely to want to make multiple adjustments,
	-- we made the activation one_shot=false. We therefore need
	-- to define a key assignment for getting out of this mode.
	-- 'resize_pane' here corresponds to the name="resize_pane" in
	-- the key assignments above.
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 2 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 2 }) },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 2 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 2 }) },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 2 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 2 }) },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 2 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 2 }) },

		-- Cancel the mode by pressing q
		{ key = "q", action = "PopKeyTable" },
	},

	-- Defines the keys that are active in our activate-pane mode.
	-- 'activate_pane' here corresponds to the name="activate_pane" in
	-- the key assignments above.
	-- activate_pane = {
	-- 	{ key = "LeftArrow", action = act.ActivatePaneDirection("Left") },
	-- 	{ key = "h", action = act.ActivatePaneDirection("Left") },
	--
	-- 	{ key = "RightArrow", action = act.ActivatePaneDirection("Right") },
	-- 	{ key = "l", action = act.ActivatePaneDirection("Right") },
	--
	-- 	{ key = "UpArrow", action = act.ActivatePaneDirection("Up") },
	-- 	{ key = "k", action = act.ActivatePaneDirection("Up") },
	--
	-- 	{ key = "DownArrow", action = act.ActivatePaneDirection("Down") },
	-- 	{ key = "j", action = act.ActivatePaneDirection("Down") },
	-- },

	activate_scroll = {
		{ key = "UpArrow", action = act.ScrollByLine(-2) },
		{ key = "k", action = act.ScrollByLine(-2) },
		{ key = "DownArrow", action = act.ScrollByLine(2) },
		{ key = "j", action = act.ScrollByLine(2) },

		{ key = "q", action = "PopKeyTable" },
	},
}
-- and finally, return the configuration to wezterm
return config
