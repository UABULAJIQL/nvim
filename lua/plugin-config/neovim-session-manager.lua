-- 存储当前目录转态
local status1, session_manager = pcall(require, "session_manager")
if not status1 then
    vim.notify("没有找到 session_manager")
    return
end

local status2, Path = pcall(require, "plenary.path")
if not status2 then
    vim.notify("没有找到 plenary.path")
    return
end

session_manager.setup({
    sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
    path_replacer = '__', -- The character to which the path separator will be replaced for session files.
    colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
    autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    -- 在退出和切换会话的时候保存最后一个会话
    autosave_last_session = false, -- Automatically save last session on exit and on session switch.
    autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
    -- 忽略保存的类型
    autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
        'gitcommit',
    },
    autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
    max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})


-- SessionSavePost 保存会话后执行
-- SessionLoadPost 加载会话后执行
-- 自动打开侧边栏
local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

vim.api.nvim_create_autocmd({ 'SessionLoadPost' }, {
    group = config_group,
    callback = function()
        require('nvim-tree').toggle(false, true)
    end,
})
