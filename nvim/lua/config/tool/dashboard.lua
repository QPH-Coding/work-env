local header = {
    [[]],
    [[]],
    [[]],
    [[          ▀████▀▄▄              ▄█ ]],
    [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
    [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
    [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
    [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
    [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
    [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
    [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
    [[   █   █  █      ▄▄           ▄▀   ]],
    [[]],
    [[]],
}

local center = {
    {
        icon = '   ',
        desc = 'Projects      ',
        key = "p",
        action = "SessionManager load_session"
    },
    {
        icon = '󰆳   ',
        desc = 'Delete projects      ',
        key = 'n',
        action = 'SessionManager delete_session'
    },
    {
        icon = '   ',
        desc = 'Recent files      ',
        key = "r",
        action = "Telescope oldfiles"
    },
    {
        icon = '   ',
        desc = 'Find files      ',
        key = 'f',
        action = 'Telescope find_files'
    },

    {
        icon = '   ',
        desc = 'Change Colorscheme      ',
        key = 'c',
        action = 'Telescope colorscheme'
    },
    {
        icon = '   ',
        desc = 'Settings      ',
        key = 's',
        action = 'cd ~/.config/nvim | edit ~/.config/nvim/init.lua'
    }
}

local config = {
    theme = "doom",
    disable_move = false,
    config = {
        header = header,
        center = center
    }
}

require('dashboard').setup(config)
