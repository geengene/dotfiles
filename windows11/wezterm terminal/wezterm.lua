-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- This will hold the configuration.
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- map from the domain name to the color scheme
local DOMAIN_TO_SCHEME = {
	-- the built-in local domain is called `local`
	["local"] = "Tokyo Night Moon",
	-- add other entries here to match the names of your various domains
	["WSL:Ubuntu"] = "Everforest Dark (Gogh)",
}

local DOMAIN_TO_IMAGE = {
	["local"] = "C:/Users/Gene/.config/wezterm/background/spiderverse.jpg",
	["WSL:Ubuntu"] = "C:/Users/Gene/.config/wezterm/background/arcane.png",
}

local DOMAIN_TO_OPACITY = {
	["local"] = {
		brightness = 0.2,
	},
	["WSL:Ubuntu"] = {
		brightness = 0.3,
	},
}

wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	overrides.color_scheme = DOMAIN_TO_SCHEME[pane:get_domain_name()]
	overrides.window_background_image = DOMAIN_TO_IMAGE[pane:get_domain_name()]
	overrides.window_background_image_hsb = DOMAIN_TO_OPACITY[pane:get_domain_name()]
	window:set_config_overrides(overrides)
end)

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
	-- color_scheme = "Tokyo Night Moon",
	default_prog = { "C:/Program Files/Git/usr/bin/zsh-5.9.exe", "-l" },
	default_domain = "local",
	font = wezterm.font("JetBrainsMono Nerd Font"), --{ weight = "Bold" }),
	window_decorations = "RESIZE",
	window_background_image = "C:/Users/Gene/.config/wezterm/background/spiderverse.jpg",
	window_background_opacity = 1,
	-- window_background_image_hsb = {
	-- 	brightness = 0.2,
	-- },
	-- text_background_opacity = 0.5,
	use_fancy_tab_bar = false,
	tab_max_width = 20,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = false,
	tab_and_split_indices_are_zero_based = false,
	show_tab_index_in_tab_bar = true,
	window_close_confirmation = "NeverPrompt",
	audible_bell = "Disabled",
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.4,
	},
}

config.leader = { key = "a", mods = "ALT" }
config.keys = {
	-- New Tabs with different Domains
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = act.SpawnCommandInNewTab({ domain = "DefaultDomain", cwd = "C:\\Users\\Gene" }),
	},
	{
		key = "t",
		mods = "ALT|SHIFT",
		action = act.SpawnCommandInNewTab({ domain = { DomainName = "WSL:Ubuntu" } }),
	},

	-- Ctrl c and Ctrl v
	{
		key = "v",
		mods = "CTRL",
		action = act.PasteFrom("Clipboard"),
	},
	{
		key = "c",
		mods = "CTRL",
		action = act.CopyTo("ClipboardAndPrimarySelection"),
	},

	-- Closing Panes and tabs
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},

	-- Splitting vertical panes with wsl and default zsh domain
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "DefaultDomain", cwd = "C:\\Users\\Gene" }),
	},
	{
		key = "v",
		mods = "SHIFT|ALT",
		action = act.SplitHorizontal({ domain = { DomainName = "WSL:Ubuntu" } }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "DefaultDomain", cwd = "C:\\Users\\Gene" }),
	},
	{
		key = "h",
		mods = "ALT|SHIFT",
		action = act.SplitVertical({ domain = { DomainName = "WSL:Ubuntu" } }),
	},

	-- Navigating Tabs
	{
		key = "n",
		mods = "LEADER",
		action = act.ShowTabNavigator,
	},
	{
		key = "j",
		mods = "ALT|SHIFT",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "k",
		mods = "ALT|SHIFT",
		action = act.ActivateTabRelative(1),
	},

	-- Resizing Panes
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},

	--Navigating between panes
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

	-- Toggle full size panes
	{
		key = "f",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},

	-- Scrolling terminal
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

	activate_scroll = {
		{ key = "UpArrow", action = act.ScrollByLine(-2) },
		{ key = "k", action = act.ScrollByLine(-2) },
		{ key = "DownArrow", action = act.ScrollByLine(2) },
		{ key = "j", action = act.ScrollByLine(2) },
		{ key = "u", action = act.ScrollByPage(-1) },
		{ key = "d", action = act.ScrollByPage(1) },

		{ key = "q", action = "PopKeyTable" },
	},
}
-- and finally, return the configuration to wezterm
return config
