local M = {}

-- 判断文件是否存在
M.exists = function(file)
    local ok, err, code = os.rename(file, file) -- 重命名函数 就是利用这个函数来判断文件是否存在
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists 权限被拒绝但是他存在
            return true
        end
    end
    return ok, err
end


return M
