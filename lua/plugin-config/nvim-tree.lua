-- 侧边栏
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
    return
end

-- 列表操作快捷键
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },
    -- 隐藏 .文件 和指定文件夹
    filters = {
        dotfiles = true,
        custom = { 'compile_commands.json' },
    },
    view = {
        -- 宽度
        width = 30,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        hide_root_folder = false,
        -- 自定义列表中快捷键
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            --quit_on_open = true,
        },
    },

    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    -- 暂时先不安装 就是说比如：打开图片可以使用windows的默认图片查看器打开
    --system_open = {
        --    cmd = 'wsl-open', -- mac 直接设置为 open
        --},

    })

    -- 自动关闭 这个不知道是啥
    --vim.cmd([[
    --autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
    --]])
