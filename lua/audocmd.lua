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

-- wsl的操作 这个检测好像不起作用啊
if vim.fn.has('wsl') then
    vim.cmd([[
    augroup MY_WSL
    autocmd!
    " 删除dd或者复制yy的时候把缓冲区中的数据存入剪切板
    autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe', @")
    " 暂时先这样 也可以判断当前状态来切换mode()函数可以获取模式
    autocmd InsertLeave * :call system('~/.config/nvim/_en.exe')
    autocmd CmdlineLeave * :call system('~/.config/nvim/_en.exe')
    augroup END
    ]])
end

vim.cmd([[

" 解决使用telescope一开始无法折叠问题
augroup _fold_bug_solution
autocmd!
autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
augroup end

" 自己的一些习惯
augroup _myslef_operate
autocmd!

" 在末尾添加分号
autocmd FileType c,cpp,cs inoremap <buffer> ;; <ESC>A;
autocmd FileType c,cpp,cs nnoremap <buffer> ;; A;<ESC>

" 插入模式向后移动一个位置
autocmd FileType c,cpp,lua,cs inoremap <buffer> [[ <ESC>la

" 关闭连续注释功能
autocmd FileType * setlocal formatoptions=ql

augroup end

]])
