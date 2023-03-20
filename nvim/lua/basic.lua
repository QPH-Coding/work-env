require('G')
-- utf8
G.g.encoding = 'utf-8'
G.o.fileencoding = 'utf-8'
-- jkhl 移动时光标周围保留10行
G.o.scrolloff = 10
G.o.sidescrolloff = 8
-- 使用相对行号
G.wo.number = true
G.wo.relativenumber = true
-- 高亮所在行
G.wo.cursorline = true
-- 显示左侧图标指示列
G.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
G.wo.colorcolumn = "80"
local tab_num = 4
-- 缩进2个空格等于一个Tab
G.o.tabstop = tab_num
G.bo.tabstop = tab_num
G.o.softtabstop = tab_num
G.o.shiftround = true
-- >> << 时移动长度
G.o.shiftwidth = tab_num
G.bo.shiftwidth = tab_num
-- 空格替代tab
G.o.expandtab = true
G.bo.expandtab = true
-- 新行对齐当前行
G.o.autoindent = true
G.bo.autoindent = true
G.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
G.o.ignorecase = true
G.o.smartcase = true
-- 搜索不要高亮
G.o.hlsearch = false
-- 边输入边搜索
G.o.incsearch = true
-- 当文件被外部程序修改时，自动加载
G.o.autoread = true
G.bo.autoread = true
-- 禁止折行
G.wo.wrap = true
-- 光标在行首尾时<Left><Right>可以跳到下一行
G.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
G.o.hidden = true
-- 鼠标支持
G.o.mouse = "a"
-- 禁止创建备份文件
G.o.backup = false
G.o.writebackup = false
G.o.swapfile = false
-- smaller updatetime
G.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
G.o.timeout = true
G.o.timeoutlen = 500
-- split window 从下边和右边出现
G.o.splitbelow = true
G.o.splitright = true
-- 样式
G.o.termguicolors = true
G.opt.termguicolors = true
-- 不可见字符的显示
G.o.list = true
-- G.o.listchars = "space:·"
-- Dont' pass messages to |ins-completin menu|
G.o.shortmess = G.o.shortmess .. 'c'
-- 补全最多显示10行
G.o.pumheight = 10
-- 永远显示 tabline
G.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 G 的模式提示
G.o.showmode = false
