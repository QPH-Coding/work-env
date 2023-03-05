require('keybinding')
require('icons')
local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("没有找到 lspconfig")
  return
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  -- 在输入模式下也更新提示，设置为 true 也许会影响性能
  update_in_insert = false,
  underline = true,
  -- severity_sort = true,
  -- float = {
  --   focusable = false,
  --   style = "minimal",
  --   border = "rounded",
  --   source = "always",
  --   header = "",
  --   prefix = "",
  -- },
})
local signs = { Error = Icons.Error, Warn = Icons.Warning, Hint = Icons.Hint, Info = Icons.Information }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = PluginKeyList.lspconfig_on_attach

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local lsp_servers = {
  'bashls', 'lua_ls', 'vimls',
  'pyright', 'pylsp', 'pyre',
  'clangd', 'cmake',
  'html', 'cssls', 'eslint', 'tsserver', 'volar',
  'gopls', 'golangci_lint_ls',
  'sqlls', 'taplo'
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
for _, s in ipairs(lsp_servers) do
  -- TODO: cssls, html, jsonls completion?
  if s == 'eslint' then
    -- eslint use EslintFixAll
    lspconfig[s].setup {
      on_attach = function(cilent, bufnr)
        on_attach(cilent, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
      flags = lsp_flags,
      capabilities = capabilities,
    }
  elseif s == 'lua_ls' then
    lspconfig[s].setup {
      settings = {
        Lua = {
          -- runtime = {
          --   -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          --   version = 'LuaJIT',
          -- },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          -- workspace = {
          --   -- Make the server aware of Neovim runtime files
          --   library = vim.api.nvim_get_runtime_file("", true),
          -- },
          -- Do not send telemetry data containing a randomized but unique identifier
          -- telemetry = {
          --   enable = false,
          -- },
          completion = {
            callSnippet = "Replace"
          }
        },
      },
      on_attach = PluginKeyList.lspconfig_on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    }
  elseif s == 'gopls' then
    lspconfig[s].setup {
      cmd = { 'gopls' },
      on_attach = PluginKeyList.lspconfig_on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      settings = {
        gopls = {
          experimentalPostfixCompletions = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
      init_options = {
        usePlaceholders = true,
      }
    }
  elseif s == 'volar' then
    lspconfig[s].setup {
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
      on_attach = PluginKeyList.lspconfig_on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    }
  elseif s == 'clangd' then
    capabilities.offsetEncoding = { "utf-16" }
    lspconfig[s].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    }
  elseif s == 'pylsp' then
    lspconfig[s].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = { 'W391' },
              maxLineLength = 100
            }
          }
        }
      }
    }
  else
    lspconfig[s].setup {
      on_attach = PluginKeyList.lspconfig_on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    }
  end
end
