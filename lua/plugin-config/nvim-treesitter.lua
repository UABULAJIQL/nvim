-- 高亮增强
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

treesitter.setup({
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言 会自动安装对应的parsers
    ensure_installed = { "c", "cpp", "vim", "lua", "json", "cmake", "python", "markdown", "proto" },
    -- 启用代码高亮模块
    highlight = {
        -- 开起treesitter高亮
        enable = true,
        -- 关闭 vim 的正则语法高亮
        additional_vim_regex_highlighting = false,
    },

    -- 启用增量选择模块
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },

    -- 启用代码缩进模块 测试了没屌用
    -- indent = { enable = true, },

    -- 添加cpp扩展
    nt_cpp_tools = {
        enable = true,
        preview = {
            quit = 'cq', -- optional keymapping for quit preview
            accept = '<tab>' -- optional keymapping for accept preview
        },
        header_extension = 'h', -- optional
        source_extension = 'cxx', -- optional
        custom_define_class_function_commands = { -- optional
        TSCppImplWrite = {
            output_handle = require 'nvim-treesitter.nt-cpp-tools.output_handlers'.get_add_to_cpp()
        }
    }
}

})
