-- bufferline
lvim.builtin.bufferline.options.separator_style = "slope"
lvim.builtin.bufferline.options.left_trunc_marker = ""
lvim.builtin.bufferline.options.right_trunc_marker = ""

-- treesitter
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
lvim.builtin.treesitter.incremental_selection = {
    enable = true,
    keymaps = {
        init_selection = "<CR><CR>", -- set to `false` to disable one of the mappings
        node_incremental = "<CR><CR>",
        scope_incremental = "<CR>o",
        node_decremental = "<BS><BS>",
    }
}

-- gitsigns
lvim.builtin.gitsigns.opts.current_line_blame_formatter = "   <author> 󱑍 <author_time:%Y-%m-%d %H:%M>: <summary>"
