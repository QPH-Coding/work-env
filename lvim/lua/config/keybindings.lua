-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["H"] = "^"
lvim.keys.normal_mode["L"] = "$"
lvim.keys.visual_mode["H"] = "^"
lvim.keys.visual_mode["L"] = "$"

lvim.keys.normal_mode["<C-h>"] = false
lvim.keys.normal_mode["<C-j>"] = false
lvim.keys.normal_mode["<C-k>"] = false
lvim.keys.normal_mode["<C-l>"] = false

lvim.keys.normal_mode["<A-h>"] = "<C-w>h"
lvim.keys.normal_mode["<A-j>"] = "<C-w>j"
lvim.keys.normal_mode["<A-k>"] = "<C-w>k"
lvim.keys.normal_mode["<A-l>"] = "<C-w>l"

lvim.keys.insert_mode["<C-h>"] = "<left>"
lvim.keys.insert_mode["<C-j>"] = "<down>"
lvim.keys.insert_mode["<C-k>"] = "<up>"
lvim.keys.insert_mode["<C-l>"] = "<right>"

lvim.keys.visual_mode["<"] = "<gv"
lvim.keys.visual_mode[">"] = ">gv"
lvim.keys.visual_mode["J"] = "<cmd>move '>+1<CR>gv-gv"
lvim.keys.visual_mode["K"] = "<cmd>move '<-2<CR>gv-gv"

lvim.keys.normal_mode["<leader>j"] = "]c"
lvim.keys.normal_mode["<leader>k"] = "[c"

lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-w>"] = ":BufferKill<CR>"

lvim.keys.normal_mode["<leader><leader>w"] = ":HopWord<CR>"
lvim.keys.normal_mode["<leader><leader>e"] = ":HopChar2<CR>"
lvim.keys.normal_mode["<leader><leader>r"] = ":HopChar1<CR>"

lvim.keys.command_mode["<tab>"] = function()
	local wilder = require("wilder")
	if wilder.in_context() then
		return wilder.next()
	end
	return "<tab>"
end
lvim.keys.command_mode["<S-tab>"] = function()
	local wilder = require("wilder")
	if wilder.in_context() then
		return wilder.previous()
	end
	return "<tab>"
end

lvim.builtin.terminal.open_mapping = "<c-t>"

-- lsp
lvim.lsp.buffer_mappings.normal_mode["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "Lsp finder" }
lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "Lsp go to definition" }
lvim.lsp.buffer_mappings.normal_mode["ga"] = { "<cmd>Lspsaga code_action<CR>", "Lsp code action" }
lvim.lsp.buffer_mappings.normal_mode["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "Lsp peek definition" }
lvim.lsp.buffer_mappings.normal_mode["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", "Lsp peek type definition" }
lvim.lsp.buffer_mappings.normal_mode["gl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Lsp show line diagnostics" }
lvim.lsp.buffer_mappings.normal_mode["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Lsp doc" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>Lspsaga outline<CR>", "Symbol outline" }

-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["w"] = { "<cmd>w<cr>", "Save" }

lvim.builtin.which_key.mappings["p"] = {
	name = "session",
	p = { "<cmd>SessionManager load_session<CR>", "Load projects Session" },
	s = { "<cmd>SessionManager save_current_session<CR>", "Save projects Session" },
	d = { "<cmd>SessionManager delete_session<CR>", "Delete projects Session" },
}

lvim.builtin.which_key.mappings["t"] = {
	name = "Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

lvim.builtin.which_key.mappings["f"] = {
	name = "find something",
	f = { "<cmd>Telescope find_files<CR>", "Telescope find files" },
	b = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Telescope find files" },
	u = { "<cmd>TodoTelescope<CR>", "Telescope Todo" },
	g = { "<cmd>Telescope live_grep<CR>", "Telescope find in workspace" },
}
-- lvim.builtin.which_key.mappings
