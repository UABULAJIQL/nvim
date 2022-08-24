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

-- markdown
_G.MarkDownImgPaste = function(imgPath)

    if (vim.bo.filetype == "markdown") then
        vim.api.nvim_command('!~/.config/nvim/cq_markdownPastePNG.exe ' .. imgPath)

    else
        vim.notify("not a markdown file")
    end

end;
