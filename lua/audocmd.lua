-- SessionSavePost 保存会话后执行
-- SessionLoadPost 加载会话后执行
-- 自动打开侧边栏
vim.api.nvim_create_autocmd({ 'SessionLoadPost' }, {
    group = vim.api.nvim_create_augroup('MyConfigGroup', { clear = true }),
    callback = function()
        require('nvim-tree').toggle(false, true)
    end,
})


-- wsl的操作 这个检测好像不起作用啊
local wsl_group = vim.api.nvim_create_augroup('_wsl', { clear = true })
if vim.fn.has('wsl') then
    vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
        group = wsl_group,
        callback = function()
            vim.fn.system('/mnt/c/windows/system32/clip.exe', vim.fn.getreg("\""))
        end,
    })

    vim.api.nvim_create_autocmd({ 'InsertLeave', 'CmdlineLeave' }, {
        group = wsl_group,
        callback = function()
            vim.fn.system('~/.config/nvim/_en.exe')
        end,
    })

end
-- md的操作
-- 离开buffer自动保存 并且关闭右边的标签
local cq_md_group = vim.api.nvim_create_augroup("cq_md_group", { clear = true })
vim.api.nvim_create_autocmd({ 'BufLeave' }, {
    group = cq_md_group,
    pattern = { "*.md" },
    callback = function()
        vim.api.nvim_command("w")
    end,
})

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
autocmd FileType c,cpp inoremap <buffer> ;; <ESC>A;
autocmd FileType c,cpp nnoremap <buffer> ;; A;<ESC>

" 插入模式向后移动一个位置
autocmd FileType c,cpp,lua,py inoremap <buffer> [[ <ESC>la

" 关闭连续注释功能
autocmd FileType * setlocal formatoptions=ql

augroup end

]])
