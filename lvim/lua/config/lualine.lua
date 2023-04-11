require("config.icons")
lvim.builtin.lualine.style = "default" -- or "none"
local components = require("lvim.core.lualine.components")
local colors = {
	blue = "#80a0ff",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ff5189",
	violet = "#d183e8",
	grey = "#303030",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.black, bg = colors.black },
	},
	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },
	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

local config = {
	options = {
		theme = bubbles_theme,
		component_separators = "|",
		section_separators = {},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				icon = "󰌪 ",
				right_padding = 2,
			},
		},
		lualine_b = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				sections = { "error", "warn", "info", "hint" },
				symbols = {
					error = Icons.Error,
					warn = Icons.Warning,
					info = Icons.Information,
					hint = Icons.Hint,
				},
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = false, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
			},
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				newfile_status = false, -- Display new file status (new file means no write after created)
				path = 0,
				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				symbols = {
					modified = "*", -- Text to show when the file is modified.
					readonly = "!", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "?", -- Text to show for unnamed buffers.
					newfile = "+", -- Text to show for newly created file before first write
				},
			},
			{ "branch", icon = "" },
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { components.lsp, components.spaces, components.filetype },
		lualine_z = { components.location },
	},
	inactive_sections = {
		lualine_a = {
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				newfile_status = false, -- Display new file status (new file means no write after created)
				path = 0, -- 0: Just the filename
				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				symbols = {
					modified = "*", -- Text to show when the file is modified.
					readonly = "!", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "?", -- Text to show for unnamed buffers.
					newfile = "+", -- Text to show for newly created file before first write
				},
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { components.location },
	},
	tabline = {},
	extensions = { "nvim-tree", "toggleterm", "symbols-outline" },
}
lvim.builtin.lualine = config
