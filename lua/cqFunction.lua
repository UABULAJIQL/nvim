-- git
_G.GitCommit = function()

    if not require("utils").exists(".git") then
        vim.notify("not find .git")
        return
    end

    local commitInfo = vim.fn.input('commit info:')
    if commitInfo ~= "" then
        vim.api.nvim_command('!git commit -m "' .. commitInfo .. '"')
    else
        vim.notify("commitInfo is null")
    end

end

-- git
_G.GitPush = function()
    if not require("utils").exists(".git") then
        vim.notify("not find .git")
        return
    end

    local value = vim.fn.input("hostname Branch or <enter>:")
    if value == "" then
        vim.api.nvim_command('!git push')
        return
    end

    local values = vim.split(value, " ")
    if #values >= 2 then
        vim.api.nvim_command('!git push -u ' .. values[1] .. ' ' .. values[2])
    else
        vim.notify("parameter error")
    end

end

--- markdown ---
-- 粘贴图片
_G.MarkDownImgPaste = function()
    if (vim.bo.filetype == "markdown") then
        local name = vim.fn.expand('%:t:r')
        local pathName = "img/" .. name .. "_"
        local result = vim.fn.system("~/.config/nvim/cq_markdownPastePNG.exe " .. pathName)
        if result == "0" then
            vim.api.nvim_command('normal o')
            vim.api.nvim_command('normal "+p')

            vim.api.nvim_command('normal 0f(lyi(')
            pathName = vim.fn.getreg('"')
            pathName = vim.fn.expand('%:p:h') .. '/' .. pathName
            vim.fn.system("python3 ~/.config/nvim/cq_bmpToPng.py " .. pathName)
            vim.api.nvim_command('w')
        else
            vim.notify("" .. result)
        end

    else
        vim.notify("not a markdown file")
    end
end;

-- 删除链接同时删除文件
_G.MarkDownDelLink = function()
    if (vim.bo.filetype == "markdown") then
        vim.api.nvim_command('normal yy')
        local value = vim.fn.getreg('"')
        local index = string.find(value, "(", 1, true)
        if index == nil then
            vim.notify("nil")
        else
            vim.api.nvim_command('normal 0f(lyi(')
            local pathName = vim.fn.getreg('"')
            pathName = vim.fn.expand('%:p:h') .. '/' .. pathName
            local ok = require("utils").exists(pathName)
            if ok then
                vim.fn.system("rm " .. pathName)
                vim.api.nvim_command('normal dd')
                vim.api.nvim_command('w')
            else
                vim.notify("file does not exist")
            end

        end
    else
        vim.notify("not a markdown file")
    end
end;

-- 自动创建cpp文件
_G.CreateCpp = function()
    local tail = vim.fn.expand('%:e')
    if tail ~= 'h' then
        return
    end

    local name = vim.fn.expand('%:r') .. '.cpp'
    local ok = require('utils').exists(name)
    if not ok then
        -- 如果不存在创建
        vim.api.nvim_command('!touch ' .. name)
        -- 追加头文件引用
        vim.api.nvim_command('!echo ' .. vim.fn.expand('\\\\#include \\"%:t\\"') .. ' >> ' .. name)
    end
    vim.api.nvim_command('vsp ' .. name)

end;


--[[

-- 已弃用
-- 重新加载omnisharp 不重新加载unity中添加新的脚本会报错
_G.OmniSharpReload = function()
    if vim.lsp.get_active_clients()[1].name == "omnisharp" then
        vim.lsp.stop_client({vim.lsp.get_active_clients()[1]}, true)
        vim.wait(100, function()
            vim.api.nvim_command('LspStart omnisharp')
        end)
    else
        vim.notify("Lsp client not is omnisharp")
    end
end

]]
