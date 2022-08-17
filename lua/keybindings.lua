-- 设置leader键
vim.g.mapleader = " "

-- 先保存本地变量
local map = vim.api.nvim_set_keymap
-- 不会重新映射 不会显示多余的信息
local opt = { noremap = true, silent = true }

-- 取消s默认功能 原：删除前字符进入插入模式
map("n", "s", "", opt)
-- 取消S默认功能 原：删除当前字符进入插入模式
map("n", "S", "", opt)

map("i", "<C-c>", "", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 关闭一个窗口
map("n", "q", ":q!<CR>", opt)
-- 关闭所有窗口
map("n", "<leader>q", ":qa!<CR>", opt)
-- 保存退出 并且会保存到session
map("n", "Q", ":SessionManager save_current_session<CR>:wqa<CR>", opt)

-- 屏移动操作
map("n", "sl", "<C-w>l", opt)
map("n", "sh", "<C-w>h", opt)
map("n", "sk", "<C-w>k", opt)
map("n", "sj", "<C-w>j", opt)
--map("n", "ss", "<C-w>w", opt)

-- 分屏操作
map("n", "Sl", ":set splitright | vsplit<CR>", opt)
map("n", "Sh", ":set nosplitright | vsplit<CR>", opt)
map("n", "Sk", ":set nosplitbelow | split<CR>", opt)
map("n", "Sj", ":set splitbelow | split<CR>", opt)

-- 关闭其他窗口
--map("n", "So", "<C-w>o", opt)

-- 窗口大小调整
map("n", "<up>", ":resize +2<CR>", opt)
map("n", "<down>", ":resize -2<CR>", opt)
map("n", "<left>", ":vertical resize -2<CR>", opt)
map("n", "<right>", ":vertical resize +2<CR>", opt)

-- 大步移动
map("n", "J", "9j", opt)
map("n", "K", "9k", opt)

-- 移动到句首和句尾巴 删除和选中有点奇怪
--map("n", "H", "0", opt)
--map("n", "L", "$", opt)

-- 当前页面打开终端
--map("n", "<leader>t", ":terminal<CR>", opt)

-- 终端退出终端
map("t", "<esc>", [[ <C-\><C-n>:q!<CR> ]], opt)

-- 终端窗口的移动
--map("t", "sl", [[ <C-\><C-n><C-w>l ]], opt)
--map("t", "sh", [[ <C-\><C-n><C-w>h ]], opt)
--map("t", "sk", [[ <C-\><C-n><C-w>k ]], opt)
--map("t", "sj", [[ <C-\><C-n><C-w>j ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)


-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye" 关闭当前标签页
map("n", "<C-q>", ":Bdelete!<CR>", opt)
-- 关闭为定义组的所有buffer other
map("n", "<C-a>q", ":BufferLineGroupClose ungrouped<CR>", opt)

-- 关闭左边或者右边的页面
--map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
-- 选择关闭页面
--map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)


-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)


local pluginKeys = {}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        --["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up", --up
        ["<C-d>"] = "preview_scrolling_down", --down
    },
}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<leader>1", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    -- 分屏打开文件
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    -- 显示隐藏文件
    { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
    { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
    -- 文件操作
    { key = "<F5>", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    --{ key = "s", action = "system_open" },
    --不禁用的话默认也上面注释的那个 会和窗口移动按键冲突
    { key = "s", action = "" },
}


-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
    -- 这里的快捷键全部替换成有小框ui的
    -- rename
    --mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)

    -- code action 提示选项
    --mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)

    -- go xx
    -- 跳转到函数定义
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)

    -- 显示提示
    --mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)

    -- 这两个不知道干嘛用的
    --mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    --mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)

    --mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    -- 查看谁调用了自己
    mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)

    -- diagnostic
    -- 如果错误在后面显示不全按这个 那么小窗口显示
    --mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)

    -- 跳到上一个错误的地方
    --mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
    -- 跳到下一个错误的地方
    --mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)

    -- 代码格式化
     mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>gg=G<c-o>", opt)

    -- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end
-- <c-i>和<c-o>可以前后跳转

-- omnisharp项目重新加载快捷键
map("n", "<c-r>", ":lua OmniSharpReload()<CR>", opt)

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 开起补全栏
        ["<C-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- 关闭补全栏目
        ["<C-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<Tab>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),


    }
end

-- sniprun 片段执行
-- 执行选中片段
map("v", "rr", ":SnipRun<CR>", opt)
-- 执行该文件
map("n", "ra", "ggVG:SnipRun<CR><c-o>", opt)

-- 清空输出
--map("n", "<leader>c", ":SnipClose<CR>", opt)

-- 大纲显示快捷键
-- 打开
map("n", "<leader>0", "<cmd>AerialToggle!<CR>", opt)
-- 向上跳
map("n", "<C-k>", "<cmd>AerialPrev<CR>", opt)
-- 向下跳
map("n", "<C-j>", "<cmd>AerialNext<CR>", opt)

pluginKeys.commentList = {

    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
        ---Line-comment toggle keymap n模式的单行注释
        line = 'gcc',
        ---Block-comment toggle keymap n模式的块注释
        block = 'gbc',
    },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
        ---Line-comment keymap v模式行注释
        line = 'gc',
        ---Block-comment keymap v模式块注释
        block = 'gb',
    },

    ---LHS of extra mappings
    ---@type table
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
}

-- git插件的按键
pluginKeys.gitsignsList = function(gitsigns)

    local mapp = vim.keymap.set

    -- Navigation
    -- 跳到下一个hunk
    mapp('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gitsigns.next_hunk() end)
        return '<Ignore>'
    end, { expr = true })

    -- 跳到上一个hunk
    mapp('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gitsigns.prev_hunk() end)
        return '<Ignore>'
    end, { expr = true })


    -- Actions
    -- add所在的hunk
    mapp({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    -- 当前buffer下的hunk全部add
    mapp('n', '<leader>hS', gitsigns.stage_buffer)
    -- 恢复到hunk之前的状态
    mapp({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    -- 当前buffer下的hunk全部恢复到没有修改之前
    mapp('n', '<leader>hR', gitsigns.reset_buffer)

    -- 恢复没提交转态 内容不恢复
    mapp('n', '<leader>hu', gitsigns.undo_stage_hunk)

    -- 查看修改了啥
    mapp('n', '<leader>hp', gitsigns.preview_hunk)

    --mapp('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    --mapp('n', '<leader>tb', gitsigns.toggle_current_line_blame)

    -- 显示这个文件所有的的变化
    mapp('n', '<leader>hd', gitsigns.diffthis)

    ---mapp('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    --mapp('n', '<leader>td', gitsigns.toggle_deleted)

    --Text object
    mapp({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

end
-- git commit
map("n", "<leader>ha", "<cmd>lua GitCommit()<cr>", opt)
-- git push
map("n", "<leader>hb", "<cmd>lua GitPush()<cr>", opt)



-- diffview
pluginKeys.diffviewList = function(actions)
    return {
        disable_defaults = false, -- Disable the default keymaps
        view = {
            -- The `view` bindings are active in the diff buffers, only when the current
            -- tabpage is a Diffview.
            ["<tab>"]      = actions.select_next_entry, -- Open the diff for the next file
            ["<s-tab>"]    = actions.select_prev_entry, -- Open the diff for the previous file
            ["gf"]         = actions.goto_file, -- Open the file in a new split in the previous tabpage
            ["<C-w><C-f>"] = actions.goto_file_split, -- Open the file in a new split
            ["<C-w>gf"]    = actions.goto_file_tab, -- Open the file in a new tabpage
            ["<leader>e"]  = actions.focus_files, -- Bring focus to the files panel
            ["<leader>b"]  = actions.toggle_files, -- Toggle the files panel.
        },
        -- 这个是在目录上面的快捷键
        file_panel = {
            ["j"]             = actions.next_entry, -- Bring the cursor to the next file entry
            ["<down>"]        = actions.next_entry,
            ["k"]             = actions.prev_entry, -- Bring the cursor to the previous file entry.
            ["<up>"]          = actions.prev_entry,
            ["<cr>"]          = actions.select_entry, -- Open the diff for the selected entry.
            ["o"]             = actions.select_entry,
            ["<2-LeftMouse>"] = actions.select_entry,
            ["-"]             = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
            ["S"]             = actions.stage_all, -- Stage all entries.
            ["U"]             = actions.unstage_all, -- Unstage all entries.
            ["X"]             = actions.restore_entry, -- Restore entry to the state on the left side.
            ["R"]             = actions.refresh_files, -- Update stats and entries in the file list.
            ["L"]             = actions.open_commit_log, -- Open the commit log panel.
            ["<c-b>"]         = actions.scroll_view(-0.25), -- Scroll the view up
            ["<c-f>"]         = actions.scroll_view(0.25), -- Scroll the view down
            ["<tab>"]         = actions.select_next_entry,
            ["<s-tab>"]       = actions.select_prev_entry,
            ["gf"]            = actions.goto_file,
            ["<C-w><C-f>"]    = actions.goto_file_split,
            ["<C-w>gf"]       = actions.goto_file_tab,
            ["i"]             = actions.listing_style, -- Toggle between 'list' and 'tree' views
            ["f"]             = actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
            ["<leader>e"]     = actions.focus_files,
            ["<leader>b"]     = actions.toggle_files,
        },
        file_history_panel = {
            ["g!"]            = actions.options, -- Open the option panel
            ["<C-A-d>"]       = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
            ["y"]             = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
            ["L"]             = actions.open_commit_log,
            ["zR"]            = actions.open_all_folds,
            ["zM"]            = actions.close_all_folds,
            ["j"]             = actions.next_entry,
            ["<down>"]        = actions.next_entry,
            ["k"]             = actions.prev_entry,
            ["<up>"]          = actions.prev_entry,
            ["<cr>"]          = actions.select_entry,
            ["o"]             = actions.select_entry,
            ["<2-LeftMouse>"] = actions.select_entry,
            ["<c-b>"]         = actions.scroll_view(-0.25),
            ["<c-f>"]         = actions.scroll_view(0.25),
            ["<tab>"]         = actions.select_next_entry,
            ["<s-tab>"]       = actions.select_prev_entry,
            ["gf"]            = actions.goto_file,
            ["<C-w><C-f>"]    = actions.goto_file_split,
            ["<C-w>gf"]       = actions.goto_file_tab,
            ["<leader>e"]     = actions.focus_files,
            ["<leader>b"]     = actions.toggle_files,
        },
        option_panel = {
            ["<tab>"] = actions.select_entry,
            ["q"]     = actions.close,
        },
    }

end

-- 启动diffview 还有多种参数需要去看文档
map("n", "<leader>ho", "<cmd>DiffviewOpen<CR>", opt)
-- 关闭diffview
map("n", "<leader>hc", "<cmd>DiffviewClose<CR>", opt) --tabclose也可以关闭
-- 切换文件面板
--map("n", "ght", "<cmd>DiffviewToggleFiles<CR>", opt)
-- 把焦点放在文件面板上
--map("n", "", "<cmd>DiffviewFocusFiles<CR>", opt)
-- 刷新
--map("n", "<leader>hr", "<cmd>DiffviewRefresh<CR>", opt)
-- 查看提示提交 还有多种参数需要去看文档
map("n", "<leader>hh", "<cmd>DiffviewFileHistory<CR>", opt)


--- gdb ---
map("n", "<leader>dr", "<cmd>GdbStart gdbr<cr>", opt)
-- 启动gdb调试
map("n", "<leader>dd", "<cmd>lua StartGdbSession()<cr>", opt)
map("n", "<leader>dc", "<cmd>lua CreateWatch()<cr>", opt)
map("n", "<leader>dbt", "<cmd>GdbLopenBacktrace<cr>", opt)
map("n", "<leader>dbp", "<cmd>GdbLopenBreakpoints<cr>", opt)

-- 按键提示
--map("n", "<leader>k", "<cmd>WhichKey<CR>", opt)

-- 浮动终端的启动和影藏
pluginKeys.toggletermList = {
    --open_mapping = "tt",
    open_mapping = [[<c-\>]],
}


return pluginKeys
