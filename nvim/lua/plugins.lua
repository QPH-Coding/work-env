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

    -- 侧边文件目录
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
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

    -- 高亮相同reference的词
    use { 'RRethy/vim-illuminate' }

    -- 函数对齐线
    use { 'lukas-reineke/indent-blankline.nvim' }

    -- 悬浮终端
    use { 'akinsho/toggleterm.nvim', tag = '*' }

    use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }

    -- telescope 模糊搜索
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- telescope extension
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- comment 快速注释
    use { 'numToStr/Comment.nvim' }
    -- 自动括号
    use { 'windwp/nvim-autopairs' }

    -- git
    use { 'lewis6991/gitsigns.nvim' }
    -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- project
    use { 'ahmedkhalf/project.nvim' }

    use { 'phaazon/hop.nvim', branch = 'v2' }

    -- lsp
    -- 语法高亮
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- 专注模式
    use { 'folke/twilight.nvim' }
    -- lsp, linters, Formatters, DAP
    use { 'williamboman/mason.nvim' }
    use { 'neovim/nvim-lspconfig' }
    -- 美化右下角的lsp progress
    use { 'j-hui/fidget.nvim', run = ':lua require("fidget").setup{}' }
    -- 代码补全
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" } -- { name = nvim_lsp }, 从lsp进行补全
    use { "hrsh7th/cmp-buffer" } -- { name = 'buffer' }, 从buffer中进行补全
    use { "hrsh7th/cmp-path" } -- { name = 'path' }, 从文件系统路径中进行补全
    use { "hrsh7th/cmp-cmdline" } -- { name = 'cmdline' }, 从命令行中进行补全
    -- TODO: use luasnip
    -- use { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp' }
    -- 光标所在作用域
    use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" }
    -- 更好的诊断
    use { "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" }
    -- 显示文件大纲
    use { 'simrat39/symbols-outline.nvim' }
    -- lspsaga lsp增强
    use {
      'glepnir/lspsaga.nvim',
      branch = "main",
      requires = {
        { "nvim-tree/nvim-web-devicons" },
        --Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" }
      }
    }
    use { 'jose-elias-alvarez/null-ls.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- use { 'mhartington/formatter.nvim' }
    -- use { "rbjorklin/symbols-outline.nvim", branch = "fix-outline-detection" }
    use { 'mfussenegger/nvim-dap' }
    use { 'theHamsta/nvim-dap-virtual-text' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'nvim-telescope/telescope-dap.nvim' }
  end,
  config = {
    display = {
      -- 使用浮动窗口显示
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
