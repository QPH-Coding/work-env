local wezterm = require("wezterm")
local M = {}
local beauty_config = {
    -- 󰊠 / 󱙝 .󰏩 /󱙵 .󰹢 /󰹣 .󰣉 /󰗝 .󰀚 /󰆤 .
    --  / . / .-- nf-dev-ionic & -- nf-fa-eercast

    active = " ",
    inactive = " ",
    mux_inactive = " ",
    mux_active = " ",
    battery = {
        Charging = "󰂄 ",
        Discharging = "󰁾 ",
        Full = "󰁹 ",
        Empty = "󰂃 ",
        Unknown = "󰂑 ",
    },
}
local color = require("color")
local bg, fg

local function battery_stat()
    local bat = ""
    for _, b in ipairs(wezterm.battery_info()) do
        bat = beauty_config.battery[b.state] .. string.format("%.0f%%", b.state_of_charge * 100)
    end
    return bat
end

local function datetime()
    -- return wezterm.strftime("󰸗  %m-%d %a  󱑍  %H:%M")
    return wezterm.strftime("󱑍  %m-%d %a %H:%M")
end

local function right_status()
    local elements = {}
    table.insert(elements, { Foreground = { Color = bg } })
    table.insert(elements, { Text = "" })
    table.insert(elements, { Background = { Color = bg } })
    table.insert(elements, { Foreground = { Color = fg } })
    table.insert(elements, { Text = " " .. battery_stat() .. " |" })
    table.insert(elements, { Text = " " .. datetime() .. " " })
    return elements
end

local function left_status(window)
    local elements = {}
    table.insert(elements, { Background = { Color = bg } })
    table.insert(elements, { Foreground = { Color = fg } })
    local mux_window = window:mux_window()
    for i, tab_with_info in pairs(mux_window:tabs_with_info()) do
        local tab = tab_with_info.tab
        local icon = ""
        if tab_with_info.is_active then
            if #tab:panes() > 1 then
                icon = beauty_config.mux_active
            else
                icon = beauty_config.active
            end
        else
            if #tab:panes() > 1 then
                icon = beauty_config.mux_inactive
            else
                icon = beauty_config.inactive
            end
        end

        local text = " " .. icon .. " "
        if i < #mux_window:tabs_with_info() then
            text = text .. "|"
        end
        table.insert(elements, { Text = text })
    end
    table.insert(elements, "ResetAttributes")
    table.insert(elements, { Foreground = { Color = bg } })
    table.insert(elements, { Text = "" })
    return elements
end

function M.status(window, pane)
    if window:leader_is_active() then
        bg = color.normal.yellow
    else
        bg = color.bright.blue
    end
    fg = color.normal.black
    window:set_left_status(wezterm.format(left_status(window)))
    window:set_right_status(wezterm.format(right_status()))
end

return M
