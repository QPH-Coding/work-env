require('icons')
local status, lspsaga = pcall(require, "lspsaga")
if not status then
  vim.notify("没有找到 lspsaga")
  return
end

lspsaga.setup({
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = "<C-d>",
    scroll_up = "<C-u>",
  },
  request_timeout = 2000,
  finder = {
    --percentage
    max_height = 0.5,
    keys = {
      jump_to = 'p',
      edit = { '<CR>' },
      vsplit = 's',
      split = 'i',
      tabe = 't',
      tabnew = 'r',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>'
    },
  },
  definition = {
    edit = "<CR>",
    vsplit = "v",
    split = "i",
    tabe = "t",
    quit = "q",
  },
  code_action = {
    num_shortcut = true,
    show_server_name = true,
    extend_gitsigns = true,
    keys = {
      -- string | table type
      quit = "q",
      exec = "<CR>",
    },
  },
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  diagnostic = {
    on_insert = true,
    on_insert_follow = true,
    insert_winblend = 0,
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    --1 is max
    max_width = 0.7,
    custom_fix = nil,
    custom_msg = nil,
    text_hl_follow = false,
    border_follow = true,
    keys = {
      exec_action = "o",
      quit = "q",
      go_action = "g"
    },
  },
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = true,
  },
  outline = {
    win_position = "right",
    win_with = "",
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = "gd",
      expand_collapse = "<CR>",
      quit = "q",
    },
  },
  callhierarchy = {
    show_detail = false,
    keys = {
      edit = "e",
      vsplit = "s",
      split = "i",
      tabe = "t",
      jump = "o",
      quit = "q",
      expand_collapse = "u",
    },
  },
  symbol_in_winbar = {
    enable = true,
    separator = " 󰥭 ",
    ignore_patterns = {},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = false,
  },
  beacon = {
    enable = true,
    frequency = 7,
  },
  ui = {
    -- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "double",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = Icons.Hint,
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {
      ['File'] = { Icons.File },
      ['Module'] = { Icons.Modle },
      ['Namespace'] = { Icons.Namespace },
      ['Package'] = { Icons.Package },
      ['Class'] = { Icons.Class },
      ['Method'] = { Icons.Method },
      ['Property'] = { Icons.Property },
      ['Field'] = { Icons.Field },
      ['Constructor'] = { Icons.Constructor },
      ['Enum'] = { Icons.Enum },
      ['Interface'] = { Icons.Interface },
      ['Function'] = { Icons.Function },
      ['Variable'] = { Icons.Variable },
      ['Constant'] = { Icons.Constant },
      ['String'] = { Icons.String },
      ['Number'] = { Icons.Number },
      ['Boolean'] = { Icons.Boolean },
      ['Array'] = { Icons.Array },
      ['Object'] = { Icons.Object },
      ['Key'] = { Icons.Keyword },
      ['Null'] = { Icons.Null },
      ['EnumMember'] = { Icons.EnumMember },
      ['Struct'] = { Icons.Struct },
      ['Event'] = { Icons.Event },
      ['Operator'] = { Icons.Operator },
      ['TypeParameter'] = { Icons.TypeParameter },
      -- ccls
      ['TypeAlias'] = { Icons.TypeAlias },
      ['Parameter'] = { Icons.TypeParameter },
      ['StaticMethod'] = { Icons.Method },
      ['Macro'] = { Icons.Macro },
      -- for completion sb microsoft!!!
      ['Text'] = { Icons.Text },
      ['Snippet'] = { Icons.Snippet },
      ['Folder'] = { Icons.Folder },
      ['Unit'] = { Icons.Unit },
      ['Value'] = { Icons.Value },
    },
  },
})
