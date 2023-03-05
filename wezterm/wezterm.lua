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
	enable_tab_bar = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	use_cap_height_to_scale_fallback_fonts = true,
	native_macos_fullscreen_mode = false,
	keys = {
		{
			key = "n",
			mods = "SHIFT|CTRL",
			action = act.ToggleFullScreen,
		},
		{ key = "j", mods = "CTRL", action = act.ScrollByPage(-1) },
		{ key = "k", mods = "CTRL", action = act.ScrollByPage(1) },
	},
}
