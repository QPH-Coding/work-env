vim.cmd([[
  augroup _load_break_points
    autocmd!
    autocmd FileType c,cpp,go,python,lua :lua require('config.dap.dap-util').load_breakpoints()
  augroup end
]])
