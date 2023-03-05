local null_ls = require("null-ls")

null_ls.setup {
  sources = {
    -- 脚本
    null_ls.builtins.code_actions.shellcheck,
    -- null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.shfmt,

    -- null_ls.builtins.diagnostics.fish,
    -- null_ls.builtins.formatting.fish_indent,

    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.diagnostics.luacheck,

    -- null_ls.builtins.diagnostics.mypy,
    -- null_ls.builtins.formatting.reorder_python_imports,
    null_ls.builtins.diagnostics.pyproject_flake8,
    -- null_ls.builtins.diagnostics.pydocstyle,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.autoflake,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.yapf,

    -- null_ls.builtins.diagnostics.zsh,

    -- 前端
    -- js, ts
    null_ls.builtins.code_actions.eslint_d,
    -- null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    -- null_ls.builtins.diagnostics.stylint,
    null_ls.builtins.formatting.stylelint,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.prettier_d_slim,

    -- 常用语言
    -- null_ls.builtins.code_actions.gomodifytags,
    -- null_ls.builtins.diagnostics.gospel,
    -- null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,

    null_ls.builtins.diagnostics.cmake_lint,
    null_ls.builtins.diagnostics.cpplint,
    null_ls.builtins.formatting.cmake_format,
    null_ls.builtins.formatting.clang_format.with({
      extra_args = { "--style=file" },
    }), -- 可能会使用formatter.nvim
    -- sql、dockerfile
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "mysql" }, -- change to your dialect
    }),
    null_ls.builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "mysql" }, -- change to your dialect
    }),
    -- 自然语言
    null_ls.builtins.diagnostics.cfn_lint, -- yaml, json
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.code_actions.cspell,
    null_ls.builtins.diagnostics.codespell,
    null_ls.builtins.diagnostics.misspell,
    -- null_ls.builtins.diagnostics.cspell,
    -- null_ls.builtins.diagnostics.codespell,
  },
  border = nil,
  cmd = { "nvim" },
  debounce = 250,
  debug = false,
  default_timeout = 5000,
  diagnostic_config = {
    -- see :help vim.diagnostic.config()
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
  },
  diagnostics_format = "[#{c}] #{m} (#{s})",
  fallback_severity = vim.diagnostic.severity.ERROR,
  log_level = "warn",
  notify_format = "[null-ls] %s",
  on_attach = nil,
  on_init = nil,
  on_exit = nil,
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
  should_attach = nil,
  temp_dir = nil,
  update_in_insert = false,
}
