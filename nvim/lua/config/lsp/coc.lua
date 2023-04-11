require('G')

G.g.coc_global_extensions = {
    'coc-marketplace',
    '@yaegassy/coc-volar',
    'coc-tsserver',
    'coc-json',
    'coc-html', 'coc-css', 'coc-html-css-support',
    'coc-clangd',
    'coc-go', 'coc-golines',
    'coc-sumneko-lua',
    'coc-vimlsp',
    'coc-sh', 'coc-db', 'coc-sqlfluff', 'coc-sql',
    'coc-pyright', 'coc-pydocstring',
    'coc-toml', 'coc-solidity',
    'coc-java',
    'coc-prettier',
    'coc-snippets', 'coc-pairs', 'coc-word',
    'coc-translator', 'coc-spell-checker', 'coc-json',
    'coc-docker',
    'coc-git', 'coc-dictionary', 'coc-swagger',
    "coc-highlight"
}

-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
G.setkey("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
G.setkey("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
G.setkey("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
-- G.setkey("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
G.setkey("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
G.setkey("n", "g[", "<Plug>(coc-diagnostic-prev)", { silent = true })
G.setkey("n", "g]", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation
G.setkey("n", "gd", "<Plug>(coc-definition)", { silent = true })
G.setkey("n", "gt", "<Plug>(coc-type-definition)", { silent = true })
G.setkey("n", "gi", "<Plug>(coc-implementation)", { silent = true })
G.map("n", "gh", ":Telescope coc references<CR>", { silent = true })


-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

G.setkey("n", "gk", '<CMD>lua _G.show_docs()<CR>', { silent = true })


-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming
G.setkey("n", "grn", "<Plug>(coc-rename)", { silent = true })

-- Formatting selected code
G.setkey("x", "fm", "<Plug>(coc-format-selected)", { silent = true })
G.setkey("n", "fm", "<Plug>(coc-format-selected)", { silent = true })


-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = { silent = true, nowait = true }
G.setkey("x", "ga", "<Plug>(coc-codeaction-selected)", opts)
G.setkey("n", "ga", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for apply code actions at the cursor position.
G.setkey("n", "gac", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply code actions affect whole buffer.
-- G.setkey("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Remap keys for applying codeActions to the current buffer
G.setkey("n", "gab", "<Plug>(coc-codeaction)", opts)
-- Apply the most preferred quickfix action on the current line.
G.setkey("n", "gqf", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
G.setkey("n", "grr", "<Plug>(coc-codeaction-refactor)", { silent = true })
G.setkey("x", "gr", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
G.setkey("n", "gr", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
G.setkey("n", "gcl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
G.setkey("x", "if", "<Plug>(coc-funcobj-i)", opts)
G.setkey("o", "if", "<Plug>(coc-funcobj-i)", opts)
G.setkey("x", "af", "<Plug>(coc-funcobj-a)", opts)
G.setkey("o", "af", "<Plug>(coc-funcobj-a)", opts)
G.setkey("x", "ic", "<Plug>(coc-classobj-i)", opts)
G.setkey("o", "ic", "<Plug>(coc-classobj-i)", opts)
G.setkey("x", "ac", "<Plug>(coc-classobj-a)", opts)
G.setkey("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true, expr = true }
G.setkey("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
G.setkey("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
G.setkey("i", "<C-f>",
    'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
G.setkey("i", "<C-b>",
    'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
G.setkey("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
G.setkey("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
G.setkey("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
G.setkey("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })


-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
-- local opts = { silent = true, nowait = true }
-- -- Show all diagnostics
-- G.setkey("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- -- Manage extensions
-- G.setkey("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- -- Show commands
-- G.setkey("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- -- Find symbol of current document
-- G.setkey("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- -- Search workspace symbols
-- G.setkey("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- -- Do default action for next item
-- G.setkey("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- -- Do default action for previous item
-- G.setkey("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- -- Resume latest coc list
-- G.setkey("n", "<space>p", ":<C-u>CocListResume<cr>", opts)
