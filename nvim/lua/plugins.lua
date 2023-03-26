local packer = require('packer')

packer.startup({
    function(use)
        -- Packer 可以升级自己
        use { 'wbthomason/packer.nvim' }

        -- 通过缓存提高加载插件的速度
        use { 'lewis6991/impatient.nvim' }

        -- themes
        -- tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
        use { 'folke/tokyonight.nvim' }
        -- zephyer
        use {
            'glepnir/zephyr-nvim',
            requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
        }
        -- github-theme
        use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }

        -- 侧边文件目录
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly'                    -- optional, updated every week. (see issue #1193)
        }

        -- bufferline 标签页
        use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
        -- lualine 底部状态栏
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', "moll/vim-bbye", opt = true }
        }

        -- notice 弹窗提示
        use {
            "folke/noice.nvim",
            requires = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            }
        }
        -- 高亮并寻找todo
        use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
        -- 超时时显示提示快捷键
        use { "folke/which-key.nvim" }

        -- 默认载入界面
        use { 'glepnir/dashboard-nvim',
            event = 'VimEnter',
            requires = { 'nvim-tree/nvim-web-devicons' }
        }
        -- 高亮相同reference的词
        use { 'RRethy/vim-illuminate' }
        -- 函数对齐线
        use { 'lukas-reineke/indent-blankline.nvim' }

        -- 悬浮终端
        use { 'akinsho/toggleterm.nvim', tag = '*' }


        -- telescope 模糊搜索
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.1',
            -- or                            , branch = '0.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }
        -- telescope extension
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        use { 'fannheyward/telescope-coc.nvim' }
        use { 'nvim-telescope/telescope-dap.nvim' }
        use { 'debugloop/telescope-undo.nvim' }

        -- beauty ui.select
        use { 'stevearc/dressing.nvim' }

        -- comment 快速注释
        use { 'numToStr/Comment.nvim' }
        -- 自动括号
        use { 'windwp/nvim-autopairs' }
        -- 环绕操作
        use { 'kylechui/nvim-surround', tag = '*' }
        -- 撤销历史记录
        -- use { 'mbbill/undotree' }
        use { 'jiaoshijie/undotree', requires = 'nvim-lua/plenary.nvim' }

        -- git
        use { 'lewis6991/gitsigns.nvim' }
        -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
        use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

        -- session 当作Project使用
        use { 'Shatur/neovim-session-manager' }

        -- motion 快速跳转
        use { 'phaazon/hop.nvim', branch = 'v2' }

        -- lsp
        use { 'neoclide/coc.nvim', branch = 'release' }
        -- 语法高亮
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        -- 专注模式
        use { 'folke/twilight.nvim' }
        -- 显示文件大纲
        use { 'stevearc/aerial.nvim' }
        -- 命令行补全
        use { 'gelguy/wilder.nvim' }
        -- 更好的诊断显示
        use { "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" }
        use { 'mfussenegger/nvim-dap' }
        use { 'theHamsta/nvim-dap-virtual-text' }
        use { 'rcarriga/nvim-dap-ui' }
    end,
    config = {
        display = {
            -- 使用浮动窗口显示
            open_fn = function()
                return require("packer.util").float({ border = "double" })
            end,
        },
        git = {
            cmd = 'git', -- The base command for git operations
            subcommands = {
                -- Format strings for git subcommands
                update         = 'pull --ff-only --progress --rebase=false',
                install        = 'clone --depth %i --no-single-branch --progress',
                fetch          = 'fetch --depth 999999 --progress',
                checkout       = 'checkout %s --',
                update_branch  = 'merge --ff-only @{u}',
                current_branch = 'branch --show-current',
                diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
                diff_fmt       = '%%h %%s (%%cr)',
                get_rev        = 'rev-parse --short HEAD',
                get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
                submodules     = 'submodule update --init --recursive --progress'
            },
            depth = 1,                                   -- Git clone depth
            clone_timeout = 60,                          -- Timeout, in seconds, for git clones
            default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
        },
    },
})
