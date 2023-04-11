lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.alpha.dashboard.section.buttons.opts.spacing = 1
lvim.builtin.alpha.dashboard.section.buttons.entries = {
	{ "p", "    Projects ", "<CMD>SessionManager load_session<CR>" },
	{ "r", "    Recent files", ":Telescope oldfiles <CR>" },
	{ "f", "    Find File", "<cmd>Telescope find_files<CR>" },
	{ "n", "    New File", "<CMD>ene!<CR>" },
	{ "t", "    Find Text", "<CMD>Telescope live_grep<CR>" },
	{ "c", "    Configuration", "<CMD>cd ~/.config/lvim | edit ~/.config/lvim/config.lua <CR>" },
	{ "q", "    Quit", "<CMD>quit<CR>" },
}
lvim.builtin.alpha.dashboard.section.footer.val = {
	[[       ]],
	[[QPH-Coding]],
	[[]],
}
lvim.builtin.alpha.dashboard.section.header.val = {
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
