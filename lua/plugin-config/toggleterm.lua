-- 终端
local status, toggleterm = pcall(require, "toggleterm")
if not status then
    vim.notify("没有找到 toggleterm")
    return
end

local list_keys = require('keybindings').toggletermList
toggleterm.setup({
    size = 20,
    --open_mapping = [[<c-\>]],
    open_mapping = list_keys.open_mapping,
    hide_numbers = true,

    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,

    insert_mappings = false,

    persist_mode = true,

    persist_size = true,

    -- 设置悬浮
    direction = "float",
    close_on_exit = false,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})


