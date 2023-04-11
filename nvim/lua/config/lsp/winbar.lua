require('G')
local parsers = require "nvim-treesitter.parsers"
local ts_utils = require('nvim-treesitter.ts_utils')
local M = {}
M.breadcrumbs = function()
    local nav = ''
    local ok, nav_var = pcall(function()
        return vim.api.nvim_buf_get_var(vim.api.nvim_get_current_buf()
        , 'coc_nav')
    end)
    if ok then
        for _, v in ipairs(nav_var) do
            if v.name ~= nil and v.label ~= nil then
                nav = nav .. ' > ' .. v.label .. v.name
            end
        end
        -- local t = { '' }
        -- for k, v in ipairs(nav_var) do
        --     setmetatable(v, {
        --         __index = function(table, key)
        --             return ' '
        --         end
        --     })
        --     t[#t + 1] = '%#' ..
        --         (v.highlight or "Normal") ..
        --         '#' .. (type(v.label) == 'string' and v.label .. ' ' or '') .. '%#Normal#' .. (v.name or '')
        --     if next(nav_var, k) ~= nil then
        --         t[#t + 1] = ' > '
        --     end
        -- end
        -- nav = table.concat(t)
    end
    vim.opt_local.winbar = nav
    -- vim.opt_local.winbar = require('nvim-treesitter.statusline').statusline({
    --     type_patterns = { "namespace", "class", "function", "method", "field", "variable" },
    --     separator = ' > '
    -- })
    return nav
end
local function get_node_text(node, bufnr)
    bufnr = bufnr or G.api.nvim_get_current_buf()
    if not node then
        return {}
    end

    -- We have to remember that end_col is end-exclusive
    local start_row, start_col, end_row, end_col = vim.treesitter.get_node_range(node)

    if start_row ~= end_row then
        local lines = G.api.nvim_buf_get_lines(bufnr, start_row, end_row + 1, false)
        if next(lines) == nil then
            return {}
        end
        lines[1] = string.sub(lines[1], start_col + 1)
        -- end_row might be just after the last line. In this case the last line is not truncated.
        if #lines == end_row - start_row + 1 then
            lines[#lines] = string.sub(lines[#lines], 1, end_col)
        end
        return lines
    else
        local line = G.api.nvim_buf_get_lines(bufnr, start_row, start_row + 1, false)[1]
        -- If line is nil then the line is empty
        return line and { string.sub(line, start_col + 1, end_col) } or {}
    end
end

local function get_node_line(node, type_patterns)
    local node_type = node:type()
    local is_valid = false
    for _, rgx in ipairs(type_patterns) do
        if node_type:find(rgx) then
            is_valid = true
            break
        end
    end
    if not is_valid then
        return ""
    end
    local line = transform_fn(vim.trim(get_node_text(node, bufnr)[1] or ""), node)
    -- Escape % to avoid statusline to evaluate content as expression
    return line:gsub("%%", "%%%%")
end

M.breadcrumbs_for_ts = function()
    local bufnr = 0
    local indicator_size = 100
    local type_patterns = { "class", "function", "method" }
    local separator = " > "
    local allow_duplicates = false

    if not parsers.has_parser() then
        return ""
    end
    local current_node = ts_utils.get_node_at_cursor()
    if not current_node then
        return ""
    end

    local cur = current_node
    while cur do
        cur = cur:parent()
    end
end
local function debug_get_node_test(node)
    local strings = get_node_text(node, 0)
    -- local result = ''
    -- for _, v in ipairs(strings) do
    --     result = result .. v
    -- end
    -- return result
    return strings[1]
end
local function debug_ts_node()
    local node = ts_utils.get_node_at_cursor()
    local result = ''
    local cur = node
    while cur do
        result = result .. '[' .. cur:type() .. ": " .. debug_get_node_test(cur) .. "]"
        cur = cur:parent()
    end
    vim.notify_once(result, vim.log.levels.INFO)
end
G.setkey("n", "<leader>dts", debug_ts_node, G.mapopt)
return M
