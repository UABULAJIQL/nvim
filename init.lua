-- 基础配置
require('basic')
-- 快捷键映射
require('keybindings')
-- 插件管理
require('plugins')
-- 主题设置
require('colorscheme')
-- autocmd
require('audocmd')
-- cq函数
require('cqFunction')

-- 侧边栏配置配置
require("plugin-config.nvim-tree")
-- 顶部标签配置
require("plugin-config.bufferline")
-- 下方提示线配置
require("plugin-config.lualine")
-- 模糊查询配置
require("plugin-config.telescope")
-- cmake配置
require("plugin-config.neovim-cmake")
-- 片段执行配置
require("plugin-config.sniprun")

-- 界面配置
require("plugin-config.dashboard")
-- 语法高亮
require("plugin-config.nvim-treesitter")
-- 大纲图
require("plugin-config.aerial")
-- 会议
require("plugin-config.neovim-session-manager")
-- 注释
require("plugin-config.comment")
-- 命令提示框
require("plugin-config.which-key")

-- 终端
require("plugin-config.toggleterm")
-- git
require("plugin-config.gitsigns")
-- gitview
require("plugin-config.diffview")
-- 括号匹配
require("plugin-config.autopairs")
-- gdb
require("plugin-config.nvim-gdb")

-- 内置LSP配置
require("lsp.setup")
-- 代码补全配置
require("lsp.cmp")

-- ui 错误警告等等图标
require("lsp.ui")

-- 高亮关键字
-- require("plugin-config.vim-illuminate")

-- 快速移动
require("plugin-config.hop")

-- markdown图标粘贴
require("plugin-config.clipboard-image")




