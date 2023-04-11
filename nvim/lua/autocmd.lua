require('G')
vim.cmd([[
  augroup _load_break_points
    autocmd!
    autocmd FileType c,cpp,go,python,lua :lua require('config.dap.dap-util').load_breakpoints()
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  " augroup _coc_highlight
  "   autocmd!
  "   autocmd CursorHold * silent call CocActionAsync('highlight')
  " augroup end

  augroup _winbar_update
    autocmd!
    autocmd CursorHold * silent :lua require('config.lsp.winbar').breadcrumbs()
  augroup end

]])
