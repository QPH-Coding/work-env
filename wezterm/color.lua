local M = {}

local scheme_name = "tokyonight"
local scheme = require("wezterm").color.get_builtin_schemes()[scheme_name]

M.normal = {
    black = scheme.ansi[1],
    red = scheme.ansi[2],
    green = scheme.ansi[3],
    yellow = scheme.ansi[4],
    blue = scheme.ansi[5],
    magenta = scheme.ansi[6],
    cyan = scheme.ansi[7],
    white = scheme.ansi[8],
}

M.bright = {
    black = scheme.brights[1],
    red = scheme.brights[2],
    green = scheme.brights[3],
    yellow = scheme.brights[4],
    blue = scheme.brights[5],
    magenta = scheme.brights[6],
    cyan = scheme.brights[7],
    white = scheme.brights[8],
}
M.background = scheme.background
M.foreground = scheme.foreground

return M
