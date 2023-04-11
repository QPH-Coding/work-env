local M = {}
M.setup = function()
    local wilder = require('wilder')
    wilder.setup({
        modes = { ':', '/', '?' },
        next_key = 0,
        previous_key = 0,
        reject_key = 0,
        accept_key = 0,
    })
    wilder.set_option('pipeline', {
        wilder.branch(
            {
                wilder.check(function(_, x)
                    return vim.fn.empty(x)
                end),
                wilder.history(15),
            },
            wilder.cmdline_pipeline({
                fuzzy = 1,
                fuzzy_filter = wilder.vim_fuzzy_filter(),
            }),
            wilder.search_pipeline()
        ),
        wilder.debounce(10)
    })
    wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_palette_theme({
            -- 'single', 'double', 'rounded' or 'solid'
            -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
            border = 'rounded',
            max_height = '75%',      -- max height of the palette
            min_height = 0,          -- set to the same as 'max_height' for a fixed height window
            prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
            reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
        })))
end

return M
