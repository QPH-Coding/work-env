local map = vim.api.nvim_set_keymap
local setkey = vim.keymap.set
local opt = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- Ctrl + 方向键 调整窗口大小
map("n", "<A-left>", ":vertical resize -2<CR>", opt)
map("n", "<A-right>", ":vertical resize +2<CR>", opt)
map("n", "<A-up>", ":resize +2<CR>", opt)
map("n", "<A-down>", ":resize -2<CR>", opt)
-- Shift + h/l 到行首或行尾
map("n", "H", "^", opt)
map("v", "H", "^", opt)
map("n", "L", "$", opt)
map("v", "L", "$", opt)
-- 插入模式下，使用Ctrl + hjkl小幅移动光标
map("i", "<C-h>", "<left>", opt)
map("i", "<C-l>", "<right>", opt)
map("i", "<C-j>", "<down>", opt)
map("i", "<C-k>", "<up>", opt)


-- ' ' + t/vt 打开终端，之后可能会弃用
-- map("n", "<leader>t", ":sp | terminal<CR> a", opt)
-- map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("n", "<leader>t", ":ToggleTerm<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- visual 模式下，JK 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 退出
map("n", "qq", ":q<CR>", opt)
map("n", "q1", ":q!<CR>", opt)
map("n", "wq", ":wq<CR>", opt)

PluginKeyList = {}

-- nvim-tree keybinding
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)
PluginKeyList.nvimTree = {
  -- user mappings go here
  { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
  { key = "<C-e>",                          action = "edit_in_place" },
  { key = "O",                              action = "edit_no_picker" },
  -- Control + j 打开当前指定的目录, Control + k 打开上级目录
  { key = { "<C-j>", "<2-RightMouse>" },    action = "cd" },
  { key = "<C-k>",                          action = "dir_up" },
  { key = "<C-v>",                          action = "vsplit" },
  { key = "<C-x>",                          action = "split" },
  { key = "<C-t>",                          action = "tabnew" },
  { key = "<",                              action = "prev_sibling" },
  { key = ">",                              action = "next_sibling" },
  { key = "P",                              action = "parent_node" },
  { key = "<BS>",                           action = "close_node" },
  { key = "<Tab>",                          action = "preview" },
  { key = "K",                              action = "first_sibling" },
  { key = "J",                              action = "last_sibling" },
  { key = "C",                              action = "toggle_git_clean" },
  { key = "I",                              action = "toggle_git_ignored" },
  { key = "H",                              action = "toggle_dotfiles" },
  { key = "B",                              action = "toggle_no_buffer" },
  { key = "U",                              action = "toggle_custom" },
  { key = "<F5>",                           action = "refresh" },
  { key = "a",                              action = "create" },
  { key = "d",                              action = "remove" },
  { key = "D",                              action = "trash" },
  { key = "r",                              action = "rename" },
  { key = "<C-r>",                          action = "full_rename" },
  { key = "e",                              action = "rename_basename" },
  { key = "x",                              action = "cut" },
  { key = "c",                              action = "copy" },
  { key = "p",                              action = "paste" },
  { key = "y",                              action = "copy_name" },
  { key = "Y",                              action = "copy_path" },
  { key = "gy",                             action = "copy_absolute_path" },
  { key = "[e",                             action = "prev_diag_item" },
  { key = "[c",                             action = "prev_git_item" },
  { key = "]e",                             action = "next_diag_item" },
  { key = "]c",                             action = "next_git_item" },
  { key = "s",                              action = "system_open" },
  { key = "f",                              action = "live_filter" },
  { key = "F",                              action = "clear_live_filter" },
  { key = "q",                              action = "close" },
  { key = "W",                              action = "collapse_all" },
  { key = "E",                              action = "expand_all" },
  { key = "S",                              action = "search_node" },
  { key = ".",                              action = "run_file_command" },
  { key = "i",                              action = "toggle_file_info" },
  { key = "g?",                             action = "toggle_help" },
  { key = "m",                              action = "toggle_mark" },
  { key = "bmv",                            action = "bulk_move" },
}

-- bufferline keybinding
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-w>", ":Bdelete<CR>", opt)

-- telescope keybinding
-- map("n", "<C-f>", ":Telescope buffers<CR>", opt)
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<leader>fs", ":Telescope grep_string<CR>", opt)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", opt)

PluginKeyList.telescope = {
  i = {
    -- 上下移动
    -- 由于出来的窗口是反向向上的，所有这里的的配置也都反向
    -- ["<C-k>"] = "move_selection_next",
    -- ["<C-j>"] = "move_selection_previous",
    ["<Up>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- treesitter keybinding
PluginKeyList.treesitter = {}
PluginKeyList.treesitter.selection = {
  init_selection = "<CR><CR>", -- set to `false` to disable one of the mappings
  node_incremental = "<CR><CR>",
  scope_incremental = "<CR>o",
  node_decremental = "<BS><BS>",
}

map('n', '<leader><space>w', ':HopWord<CR>', opt)
map('n', '<leader><space>e', ':HopChar2<CR>', opt)
map('n', '<leader><space>r', ':HopChar1<CR>', opt)

-- Mason keybinding
PluginKeyList.mason = {
  -- Keymap to expand a package
  toggle_package_expand = "<CR>",
  -- Keymap to install the package under the current cursor position
  install_package = "i",
  -- Keymap to reinstall/update the package under the current cursor position
  update_package = "u",
  -- Keymap to check for new version for the package under the current cursor position
  check_package_version = "c",
  -- Keymap to update all installed packages
  update_all_packages = "U",
  -- Keymap to check which installed packages are outdated
  check_outdated_packages = "C",
  -- Keymap to uninstall a package
  uninstall_package = "X",
  -- Keymap to cancel a package installation
  cancel_installation = "<C-c>",
  -- Keymap to apply language filter
  apply_language_filter = "<C-f>",
}

-- twilight zen-mode
map("n", "<leader>z", ":Twilight<CR>", opt)

-- lspconfig keybinding & navic
setkey('n', '<space>e', vim.diagnostic.open_float, opt)
-- setkey('n', 'dk', vim.diagnostic.goto_prev, opt)
-- setkey('n', 'dj', vim.diagnostic.goto_next, opt)
-- setkey('n', '<space>q', vim.diagnostic.setloclist, opt)

-- local navic = require("nvim-navic")
-- -- NOTE: 如果出现warn可以在这里添加
-- local skip_navic = { 'cmake', 'golangci_lint_ls' }
-- local is_skip_navic = function(client)
--   for _, server in ipairs(skip_navic) do
--     if server == client.name then
--       return true
--     end
--   end
--   return false
-- end
PluginKeyList.lspconfig_on_attach = function(client, bufnr)
  -- 禁用格式化功能，交给专门插件插件处理
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- if not is_skip_navic(client) then
  --   navic.attach(client, bufnr)
  -- end
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- setkey('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- setkey('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- setkey('n', 'K', vim.lsp.buf.hover, bufopts)
  setkey('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- setkey('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  setkey('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  setkey('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  setkey('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  -- setkey('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- setkey('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- setkey('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- setkey('n', 'gr', vim.lsp.buf.references, bufopts)
  setkey('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- lspsaga keybinding

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
map("n", "gh", ":Lspsaga lsp_finder<CR>", opt)

-- Code action
map("n", "<leader>ca", ":Lspsaga code_action<CR>", opt)
map("v", "<leader>ca", ":Lspsaga code_action<CR>", opt)

-- Rename all occurrences of the hovered word for the entire file
-- map("n", "gr", ":Lspsaga rename<CR>", opt)

-- Rename all occurrences of the hovered word for the selected files
map("n", "gr", ":Lspsaga rename ++project<CR>", opt)

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
map("n", "gd", ":Lspsaga peek_definition<CR>", opt)

-- Go to definition
-- map("n", "gd", ":Lspsaga goto_definition<CR>", opt)

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
map("n", "gt", ":Lspsaga peek_type_definition<CR>", opt)

-- Go to type definition
-- map("n", "gt", ":Lspsaga goto_type_definition<CR>", opt)


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
map("n", "<leader>sl", ":Lspsaga show_line_diagnostics ++unfocus<CR>", opt)

-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
-- map("n", "<leader>sc", ":Lspsaga show_cursor_diagnostics ++unfocus<CR>", opt)

-- Show buffer diagnostics
-- 使用了trouble.nvim去代替
-- map("n", "<leader>sb", ":Lspsaga show_buf_diagnostics<CR>", opt)

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
-- map("n", "[e", ":Lspsaga diagnostic_jump_prev<CR>", opt)
-- map("n", "]e", ":Lspsaga diagnostic_jump_next<CR>", opt)

-- Diagnostic jump with filters such as only jumping to an error
-- map("n", "[E", function()
--   require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end, opt)
-- map("n", "]E", function()
--   require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end, opt)

-- Toggle outline
map("n", "<leader>o", ":Lspsaga outline<CR>", opt)

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
map("n", "K", ":Lspsaga hover_doc<CR>", opt)

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
-- map("n", "K", ":Lspsaga hover_doc ++keep<CR>", opt)

-- Call hierarchy
map("n", "<Leader>ci", ":Lspsaga incoming_calls<CR>", opt)
map("n", "<Leader>co", ":Lspsaga outgoing_calls<CR>", opt)

-- Floating terminal
-- 使用ToggleTerm.nvim代替
-- map("n", "<A-d>", ":Lspsaga term_toggle<CR>", opt)
-- map("t", "<A-d>", ":Lspsaga term_toggle<CR>", opt)


-- cmp keybinding
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
PluginKeyList.cmpkey = function(cmp)
  return {
    ['<CR>'] = cmp.mapping.confirm {
      -- behavior = cmp.ConfirmBehavior.Insert,
      -- select = true,
    },
    -- 解决complete 选择错误之后，不能自动刷新补全
    ['<BS>'] = function(fallback)
      fallback()
      if cmp.visible() then
        cmp.mapping.abort()
        cmp.mapping.complete()
      end
    end,
    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ["<A-,>"] = cmp.mapping(
      {
        i = cmp.mapping.abort(),
        s = cmp.mapping.close()
      }
    ),
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete()),
    -- 如果窗口内容太多，可以滚动
    -- ["<A-u>"] = cmp.mapping(cmp.mapping.scroll_docs( -4), { "i", "c" }),
    -- ["<A-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
  }
end

-- gitsigns keybinding
PluginKeyList.gitsignsKey = function(bufnr)
  local function map(mode, lhs, rhs, opts)
    opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
  end

  -- Gitsigns keybinding
  -- Navigation
  map('n', '<leader>hj', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
  map('n', '<leader>hk', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

  -- Actions
  map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
  map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
  map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
  map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
  map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
  map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
  map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
  map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
  -- map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
  -- map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
  map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
  map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
  map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

  -- Text object
  map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  map('n', '<leader>hl', ':Gitsigns setqflist<CR>')
  map('v', '<leader>hl', ':Gitsigns setqflist<CR>')
end

map('n', '<leader>b',
  ':lua require("dap").toggle_breakpoint();require("config.dap.dap-util").store_breakpoints(true)<CR>', opt)
map('n', '<leader>db', ':lua require("dap").continue()<CR>', opt)
map('n', '<C-i>', ':lua require("dap").step_into()<CR>', opt)
map('n', '<C-o>', ':lua require("dap").step_out()<CR>', opt)
map('n', '<C-p>', ':lua require("dap").step_over()<CR>', opt)
