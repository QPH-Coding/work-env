require("config.icons")
local M = {}
lvim.lsp.installer.setup.ensure_installed = {
	"autoflake",
	"awk-language-server",
	"bash-debug-adapter",
	"cfn-lint",
	"clang-format",
	"clangd",
	"cmake-language-server",
	"cpptools",
	"debugpy",
	"delve",
	"goimports",
	"golines",
	"gopls",
	"isort",
	"lua-language-server",
	"prettier",
	"pyright",
	"rust-analyzer",
	"rustfmt",
	"shfmt",
	"stylua",
	"vim-language-server",
	"yapf",
}
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
require("lvim.lsp.manager").setup("pyright", {
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "off",
				autoImportCompletions = true,
			},
		},
	},
})
require("lvim.lsp.manager").setup("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "lvim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "autoflake", filetypes = { "python" } },
	{ command = "isort", filetypes = { "python" } },
	{ command = "yapf", filetypes = { "python" } },
	{ command = "clang-format", filetypes = { "cpp", "c" } },
	{ command = "stylua", filetypes = { "lua" } },
	{
		command = "prettier",
		args = { "--print-width", "120" },
		filetypes = { "json", "yaml", "vue", "html", "css", "typescript", "javascript" },
	},
})
local notify = vim.notify
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end
	notify(msg, ...)
end
-- lvim.lsp.null_ls.setup.on_init = function(new_client, _)
-- 	new_client.offset_encoding = "utf-16"
-- end

-- lspsaga
local kind = {
	["File"] = { Icons.File, "Tag" },
	["Module"] = { Icons.Module, "Exception" },
	["Namespace"] = { Icons.Namespace, "Include" },
	["Package"] = { Icons.Package, "Label" },
	["Class"] = { Icons.Class, "Include" },
	["Method"] = { Icons.Method, "Function" },
	["Property"] = { Icons.Property, "@property" },
	["Field"] = { Icons.Field, "@field" },
	["Constructor"] = { Icons.Constructor, "@constructor" },
	["Enum"] = { Icons.Enum, "@number" },
	["Interface"] = { Icons.Interface, "Type" },
	["Function"] = { Icons.Function, "Function" },
	["Variable"] = { Icons.Variable, "@variable" },
	["Constant"] = { Icons.Constant, "Constant" },
	["String"] = { Icons.String, "String" },
	["Number"] = { Icons.Number, "Number" },
	["Boolean"] = { Icons.Boolean, "Boolean" },
	["Array"] = { Icons.Array, "Type" },
	["Object"] = { Icons.Object, "Type" },
	["Key"] = { Icons.Keyword, "" },
	["Null"] = { Icons.Null, "Constant" },
	["EnumMember"] = { Icons.EnumMember, "Number" },
	["Struct"] = { Icons.Struct, "Type" },
	["Event"] = { Icons.Event, "Constant" },
	["Operator"] = { Icons.Operator, "Operator" },
	["TypeParameter"] = { Icons.TypeParameter, "Type" },
	-- ccls
	["TypeAlias"] = { Icons.TypeAlias, "Type" },
	["Parameter"] = { Icons.Field, "@parameter" },
	["StaticMethod"] = { Icons.Method, "Function" },
	["Macro"] = { Icons.Macro, "Macro" },
	-- for completion sb microsoft!!!
	["Text"] = { Icons.Text, "String" },
	["Snippet"] = { Icons.Snippet, "@variable" },
	["Folder"] = { Icons.Folder, "Title" },
	["Unit"] = { Icons.Unit, "Number" },
	["Value"] = { Icons.Value, "@variable" },
}

M.lspsaga_config = {
	symbol_in_winbar = {
		enable = false,
	},
	ui = {
		-- This option only works in Neovim 0.9
		title = true,
		-- Border type can be single, double, rounded, solid, shadow.
		border = "single",
		winblend = 0,
		expand = "",
		collapse = "",
		code_action = "󰌵 ",
		incoming = " ",
		outgoing = " ",
		hover = " ",
		kind = kind,
	},
}
return M
