local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "<leader>s\\", ":vsp<CR>", opt)
map("n", "<leader>s-", ":sp<CR>", opt)
-- 关闭当前
map("n", "<leader>sc", "<C-w>c", opt)
-- 关闭其他
map("n", "<leader>so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- Ctrl + 方向键 调整窗口大小
map("n", "<A-left>", ":vertical resize -2<CR>", opt)
map("n", "<A-right>", ":vertical resize +2<CR>", opt)
map("n", "<A-up>", ":resize +2<CR>", opt)
map("n", "<A-down>", ":resize -2<CR>", opt)
-- Shift + h/l 到行首或行尾
map("n", "H", "^", opt)
map("v", "H", "^", opt)
map("n", "L", "$", opt)
map("v", "L", "$", opt)
-- 插入模式下，使用Ctrl + hjkl小幅移动光标
map("i", "<C-h>", "<left>", opt)
map("i", "<C-l>", "<right>", opt)
map("i", "<C-j>", "<down>", opt)
map("i", "<C-k>", "<up>", opt)

-- 终端相关
map("n", "<leader>t", ":ToggleTerm<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- visual 模式下，JK 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 退出
map("n", "qq", ":q<CR>", opt)
map("n", "q1", ":q!<CR>", opt)
map("n", "<leader>w", ":w<CR>", opt)

-- diff
map("n", "<leader>j", "]c", opt)
map("n", "<leader>k", "[c", opt)
