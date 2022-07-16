-- NOTE: nvimgdb 依赖 gdb with python support
-- 检查方式为: gdb --config
-- 输出类似如下:
--with-python=/usr
--with-python-libdir=/usr/lib

-- 如果不支持python, 需要从源码编译gdb:
-- 1. 下载gdb源码: https://ftp.gnu.org/gnu/gdb/, 并解压
-- 2. ./configure --with-python
-- 3. make
-- 4. make install

vim.cmd([[
    let g:nvimgdb_disable_start_keymaps = 1
    let g:nvimgdb_use_find_executables = 0
    let g:nvimgdb_use_cmake_to_find_executables = 0
    let w:nvimgdb_termwin_command = "rightbelow vnew"
    let w:nvimgdb_codewin_command = "vnew"
    let g:nvimgdb_config_override = {
      \ 'key_next': '-n',
      \ 'key_step': '-s',
      \ 'key_finish': '-f',
      \ 'key_continue': '-c',
      \ 'key_until': '-u',
      \ 'key_breakpoint': '-b',
  \ }
]])

-- vim.cmd([[
--   nnoremap <silent> <expr> <leader>dd ":GdbStart gdb -q " . input("debugee file path: ") . "\<ESC>"
-- ]])

-- 初始化开4个窗口
_G.GdbSessionInit = function()
    -- restore breakpoints if possible
    if require("utils").exists('.bps.txt') then
        vim.defer_fn(function() -- 延迟调用
            --加载gdb调试存储文件
            vim.api.nvim_command(":Gdb source .bps.txt")
        end, 300)
    end

    -- 一开始默认在右边开一个gdb窗口
    -- create bt & info locals window

    -- 下方启动一个线程栈窗口
    vim.api.nvim_command(":belowright GdbCreateWatch thread apply all bt")

    -- 光标移动到左边
    vim.api.nvim_command(":wincmd h") -- 向右移动窗口

    -- 开起属性窗口
    vim.api.nvim_command(":belowright GdbCreateWatch info locals")

    -- move cursor back to gdb terminal 将光标移回gdb窗口
    vim.api.nvim_command(":wincmd k") -- 光标向上移动
    -- 最后结果一定要在gdb窗口上不然会报错
end

-- 定义启动gdb调试的全局函数
_G.StartGdbSession = function()
    -- start gdb sessoin
    local exec_file = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    vim.api.nvim_command(":GdbStart gdb -q " .. exec_file)
end

-- 开一个窗口
_G.CreateWatch = function()
    local watch_arg = vim.fn.input('Watch cmd: ')
    vim.api.nvim_command(":GdbCreateWatch " .. watch_arg)
end

-- 关闭所有窗口的缓冲区 在退出的使用调用
_G.CloseWatchBuffers = function()
    vim.defer_fn(function()
        vim.api.nvim_command(":bd! thread info") -- 这个猜测是在gdb中执行命令吧
    end, 10)
end

vim.cmd([[
    " User 是用户自定义行为
    "开始的时候
    autocmd User NvimGdbStart :lua GdbSessionInit()
    "退出的时候
    autocmd User NvimGdbCleanup :lua CloseWatchBuffers()
]])
