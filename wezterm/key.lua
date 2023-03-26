local M = {}
local act = require("wezterm").action
M.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
M.key = {
    { key = "n",          mods = "SHIFT|CTRL",  action = act.ToggleFullScreen },
    { key = "q",          mods = "SHIFT|CTRL",  action = act.QuickSelect },
    -- pane
    { key = "\\",         mods = "LEADER",      action = act.SplitHorizontal({ domain = "DefaultDomain" }) },
    { key = "-",          mods = "LEADER",      action = act.SplitVertical({ domain = "DefaultDomain" }) },
    { key = "UpArrow",    mods = "LEADER",      action = act.ScrollByPage(-1) },
    { key = "DownArrow",  mods = "LEADER",      action = act.ScrollByPage(1) },
    { key = "h",          mods = "LEADER",      action = act.ActivatePaneDirection("Left") },
    { key = "l",          mods = "LEADER",      action = act.ActivatePaneDirection("Right") },
    { key = "k",          mods = "LEADER",      action = act.ActivatePaneDirection("Up") },
    { key = "j",          mods = "LEADER",      action = act.ActivatePaneDirection("Down") },
    { key = "w",          mods = "LEADER",      action = act.CloseCurrentPane { confirm = true } },
    { key = "LeftArrow",  mods = "SHIFT",       action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "DownArrow",  mods = "SHIFT",       action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "UpArrow",    mods = "SHIFT",       action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "RightArrow", mods = "SHIFT",       action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "s",          mods = "LEADER",      action = act.PaneSelect({ alphabet = "1234567890" }) },
    { key = "z",          mods = "LEADER",      action = act.TogglePaneZoomState },
    -- tab
    { key = "x",          mods = "LEADER",      action = act.CloseCurrentTab({ confirm = true }) },
    { key = "{",          mods = "LEADER",      action = act.MoveTabRelative(-1) },
    { key = "}",          mods = "LEADER",      action = act.MoveTabRelative(1) },
    { key = "p",          mods = "LEADER",      action = act.ActivateTabRelativeNoWrap(-1) },
    { key = "p",          mods = "LEADER|CTRL", action = act.ActivateTabRelativeNoWrap(-1) },
    { key = "n",          mods = "LEADER",      action = act.ActivateTabRelativeNoWrap(1) },
    { key = "n",          mods = "LEADER|CTRL", action = act.ActivateTabRelativeNoWrap(1) },
    { key = "c",          mods = "LEADER",      action = act.SpawnTab("DefaultDomain") },
    -- font size
    { key = "-",          mods = "CTRL",        action = act.DecreaseFontSize },
    { key = "=",          mods = "CTRL",        action = act.IncreaseFontSize },
    { key = "0",          mods = "CTRL",        action = act.ResetFontSize },
    -- copy, paste
    { key = "C",          mods = "CTRL|SHIFT",  action = act.CopyTo("ClipboardAndPrimarySelection") },
    { key = "V",          mods = "CTRL|SHIFT",  action = act.PasteFrom("Clipboard") },
    { key = "V",          mods = "CTRL",        action = act.PasteFrom("PrimarySelection") },
    -- search
    { key = "f",          mods = "LEADER",      action = act.Search({ CaseInSensitiveString = "" }) },
    { key = "g",          mods = "LEADER",      action = act.Search({ CaseSensitiveString = "" }) },
}

return M
