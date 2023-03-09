local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("update-status", require("status_line").status)

return {
    -- font = wez.font "FuraMono Nerd Font",
    font = wezterm.font_with_fallback({
        "Maple Mono",
        "Symbols Nerd Font Mono",
    }),
    font_size = 15.0,
    color_scheme = 'tokyonight',
    window_background_opacity = 0.75,
    enable_scroll_bar = true,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    pane_focus_follows_mouse = true,
    use_cap_height_to_scale_fallback_fonts = true,
    native_macos_fullscreen_mode = false,
    -- tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    show_tabs_in_tab_bar = false,
    show_new_tab_button_in_tab_bar = false,
    leader = require("key").leader,
    keys = require("key").key,
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
    },
}
