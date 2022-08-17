local status, packer = pcall(require, "packer")
if not status then
    vim.notify("没有找到 packer")
    return
end

packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use("wbthomason/packer.nvim")

        -- 主题
        use("folke/tokyonight.nvim")

        -- nvim-tree 侧边栏
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

        -- bufferline 顶部标签栏
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })

        -- lualine 下方提示线
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        -- 提示线的扩展
        use("arkav/lualine-lsp-progress")

        -- telescope 模糊搜索快速打开文件
        use({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })
        -- 选择ui
        use("nvim-telescope/telescope-ui-select.nvim")
        -- telescope extensions 可以显示查看环境变量
        --use "LinArcX/telescope-env.nvim"

        -- dashboard-nvim 主界面
        use("glepnir/dashboard-nvim")

        -- project 好像是项目管理插件 有了session所以可以不用了
        --use("ahmedkhalf/project.nvim")

        -- treesitter 语法高亮增强
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

        --------------------- LSP --------------------
        -- LSP原来不是代码补全提示啥的 而是报错提醒和跳转啥的
        -- Language Server管理 可自动安装Language Server
        --use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
        use({ "williamboman/nvim-lsp-installer" })
        -- Lspconfig LSP
        use({ "neovim/nvim-lspconfig" })

        -- code action提示
        --use ("kosayoda/vim-lightbulb")
        -- 函数增强 提示输入的参数
        --use "ray-x/lsp_signature.nvim"


        --------------------- 代码补全 --------------------
        -- 补全引擎cmp
        use("hrsh7th/nvim-cmp")
        -- snippet 引擎 这个是用来自定义代码段的
        use("hrsh7th/vim-vsnip")
        ---补全源---
        -- 获取vim-vsnip中的源
        use("hrsh7th/cmp-vsnip")
        -- 这个是neovim内置LSP的补全内容
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        -- 补全当前buffer的内容
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        -- 这个路径补全
        use("hrsh7th/cmp-path") -- { name = 'path' }
        -- 这个是命令行的补全
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

        --use("github/copilot.vim")

        -- 常见编程语言代码段
        --暂时没有用到 现在用的是vsnip 在cmp配置中可以设置
        --use("rafamadriz/friendly-snippets")

        -- JSON 增强
        --use("b0o/schemastore.nvim")
        -- clangd增强
        --use("p00f/clangd_extensions.nvim")


        --------------------- ui美化 --------------------
        -- 代码提示后面显示类型ui
        use("onsails/lspkind-nvim")
        -- indent-blankline 大括号中会有连线 感觉没必要
        --use("lukas-reineke/indent-blankline.nvim")
        -- 各种小框框
        use("tami5/lspsaga.nvim")

        -- 突出显示当前光标下的单词
        --use "RRethy/vim-illuminate"

        -- 代码格式话现在的Language Server好像自带格式化
        -- 注意：代码格式化和代码缩进是不同的 比如：格式化也会馆逗号后面加一个空格

        -- cmake
        use({ "Shatur/neovim-cmake", requires = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } })

        -- 片段执行
        use({ "michaelb/sniprun", run = "bash ./install.sh" })

        -- 终端
        use({ "akinsho/toggleterm.nvim", tag = 'v2.*' })

        -- 选择框
        use({ "folke/which-key.nvim" })

        -- 保存工作状态
        use({ "Shatur/neovim-session-manager", requires = { "nvim-lua/plenary.nvim" } })

        -- 文件大纲图
        use("stevearc/aerial.nvim")

        -- 快速注释
        use("numToStr/Comment.nvim")

        -- git插件
        use("lewis6991/gitsigns.nvim")

        -- git视图查看插件
        use({ "sindrets/diffview.nvim", require = { "nvim-lua/plenary.nvim" } })

        -- 括号匹配
        use("windwp/nvim-autopairs")

        -- 突出显示光标下变量
        use("RRethy/vim-illuminate")

        -- gdb
        use({ "sakhnik/nvim-gdb", run = "./install.sh" })




    end,
    config = {

        -- 以悬浮创建打开安装列表
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
--pcall(
--    vim.cmd,
--    [[
--        augroup packer_user_config
--        autocmd!
--        autocmd BufWritePost plugins.lua source <afile> | PackerSync
--        augroup end
--    ]]
--)
