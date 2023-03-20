require('G')
local status, telescope = pcall(require, "telescope")
if not status then
    vim.notify("没有找到 telescope")
    return
end

telescope.setup(
    {
        defaults = {
            -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
            initial_mode = "insert",
            -- 窗口内快捷键
            mappings = {
                i = {
                    -- 上下移动
                    -- 由于出来的窗口是反向向上的，所有这里的的配置也都反向
                    -- ["<C-k>"] = "move_selection_next",
                    -- ["<C-j>"] = "move_selection_previous",
                    ["<Tab>"] = "move_selection_previous",
                    ["<S-Tab>"] = "move_selection_next",
                    -- 历史记录
                    -- ["<C-n>"] = "cycle_history_next",
                    -- ["<C-p>"] = "cycle_history_prev",
                    -- 关闭窗口
                    ["<C-c>"] = "close",
                    -- 预览窗口上下滚动
                    ["<C-b>"] = "preview_scrolling_up",
                    ["<C-f>"] = "preview_scrolling_down",
                }
            },
        },
        pickers = {
            -- 内置 pickers 配置
        },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
            coc = {
                prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
            }
        },
    }
)

-- keybindings: telescope
G.map("n", "<leader>ff", ":Telescope find_files<CR>", G.opt)
G.map("n", "<leader>fs", ":Telescope grep_string<CR>", G.opt)
G.map("n", "<leader>fg", ":Telescope live_grep<CR>", G.opt)
G.map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", G.opt)
G.map("n", "<leader>fp", ":Telescope projects<CR>", G.opt)
telescope.load_extension('fzf')
telescope.load_extension('noice')
telescope.load_extension('projects')
telescope.load_extension('coc')
-- telescope.load_extension('dap')
