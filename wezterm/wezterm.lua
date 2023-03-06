local wezterm = require("wezterm")
local act = wezterm.action

return {
	-- font = wez.font "FuraMono Nerd Font",
	font = wezterm.font_with_fallback({
		"Maple Mono",
		"Symbols Nerd Font Mono",
	}),
	font_size = 15.0,
	--   color_scheme = 'tokyonight-storm'
	window_background_opacity = 0.5,
	enable_scroll_bar = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	use_cap_height_to_scale_fallback_fonts = true,
	native_macos_fullscreen_mode = false,
	-- tab_bar_at_bottom = true,
	use_fancy_tab_bar = true,
	show_new_tab_button_in_tab_bar = false,
	tab_bar_style = {
		active_tab_left = wezterm.format({
			{ Background = { Color = "#0b0022" } },
			{ Foreground = { Color = "#2b2042" } },
			{ Text = "󰱯 "},
		}),
		active_tab_right = wezterm.format({
			{ Background = { Color = "#0b0022" } },
			{ Foreground = { Color = "#2b2042" } },
			{ Text = ""},
		}),
		inactive_tab_left = wezterm.format({
			{ Background = { Color = "#0b0022" } },
			{ Foreground = { Color = "#1b1032" } },
			{ Text = "󰇴 "},
		}),
		inactive_tab_right = wezterm.format({
			{ Background = { Color = "#0b0022" } },
			{ Foreground = { Color = "#1b1032" } },
			{ Text = ""},
		}),
	},
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{
			key = "n",
			mods = "SHIFT|CTRL",
			action = act.ToggleFullScreen,
		},
		{ key = "q", mods = "SHIFT|CTRL", action = wezterm.action.QuickSelect },
		-- pane
		{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "DefaultDomain" }) },
		{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "DefaultDomain" }) },
		{ key = "UpArrow", mods = "LEADER", action = act.ScrollByPage(-1) },
		{ key = "DownArrow", mods = "LEADER", action = act.ScrollByPage(1) },
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "LeftArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "DownArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "UpArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "RightArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "s", mods = "LEADER", action = act.PaneSelect({ alphabet = "1234567890" }) },
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
		-- tab
		{ key = "x", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "{", mods = "LEADER", action = act.MoveTabRelative(-1) },
		{ key = "}", mods = "LEADER", action = act.MoveTabRelative(1) },
		{ key = "p", mods = "LEADER", action = act.ActivateTabRelativeNoWrap(-1) },
		{ key = "n", mods = "LEADER", action = act.ActivateTabRelativeNoWrap(1) },
		{ key = "c", mods = "LEADER", action = act.SpawnTab("DefaultDomain") }, -- Create a new tab in the default domain
		-- font size
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },
		-- copy, paste
		{ key = "C", mods = "CTRL|SHIFT", action = act.CopyTo("ClipboardAndPrimarySelection") },
		{ key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
		{ key = "V", mods = "CTRL", action = act.PasteFrom("PrimarySelection") },
		-- search
		{
			key = "f",
			mods = "LEADER",
			action = act.Search({ CaseInSensitiveString = "" }),
		},
		-- {
		-- 	key = "g",
		-- 	mods = "LEADER",
		-- 	action = act.Search({ CaseSensitiveString = "" }),
		-- },
	},
	mouse_bindings = {
		-- mouse scroll
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "NONE",
			action = act.ScrollByCurrentEventWheelDelta,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "NONE",
			action = act.ScrollByCurrentEventWheelDelta,
		},
		{
			event = { Down = { streak = 2, button = "Left" } },
			action = act.SelectTextAtMouseCursor("SemanticZone"),
			mods = "NONE",
		},
	},
}
