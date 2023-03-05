require('icons')
local status, cmp = pcall(require, "cmp")
if not status then
  vim.notify("没有找到 nvim-cmp")
  return
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local format_config = {
  max_width = 0,
  duplicates = {
    buffer = 1,
    path = 1,
    nvim_lsp = 0,
    luasnip = 1,
  },
  duplicates_default = 0,
  source_names = {
    nvim_lsp = "(LSP)",
    treesitter = "(TS)",
    -- emoji = "(Emoji)",
    path = "(Path)",
    calc = "(Calc)",
    -- cmp_tabnine = "(Tabnine)",
    luasnip = "(Snippet)",
    buffer = "(Buffer)",
    spell = "(Spell)",
  }
}

cmp.setup {
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      -- For `vsnip` users.
      -- vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body)

      -- For `snippy` users.
      -- require'snippy'.expand_snippet(args.body)
    end,
  },
  -- 补全源
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    -- For vsnip users.
    -- { name = "vsnip" },

    -- For luasnip users.
    -- { name = 'luasnip' },

    --For ultisnips users.
    -- { name = 'ultisnips' },

    -- -- For snippy users.
    -- { name = 'snippy' },
  }, { { name = "buffer" }, { name = "path" } }),
  mapping = PluginKeyList.cmpkey(cmp),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- if vim.tbl_contains({ 'path' }, entry.source.name) then
      --   local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
      --   if icon then
      --     vim_item.kind = icon
      --     vim_item.kind_hl_group = hl_group
      --     return vim_item
      --   end
      -- end
      -- vim_item.kind = format_config.cmp_kinds[vim_item.kind] or ""
      -- return vim_item
      local max_width = format_config.max_width
      if max_width ~= 0 and #vim_item.abbr > max_width then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
      end
      vim_item.kind = Icons[vim_item.kind]
      vim_item.menu = format_config.source_names[entry.source.name]
      vim_item.dup = format_config.duplicates[entry.source.name]
          or format_config.duplicates_default
      return vim_item
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- completion = {
  --   ---@usage The minimum length of a word to complete on.
  --   keyword_length = 1,
  -- },
  -- experimental = {
  --   ghost_text = false,
  --   native_menu = false,
  -- },
}


-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

cmp.event:on(
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)
