-- 主页
local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.custom_footer = {
  "",
  "",
  "傻强傻逼",
}

db.custom_center = {
  {
    icon = "  ",
    -- 打开一个项目
    desc = "Sessions                            ",
    --action = "Telescope projects",
    action = "SessionManager load_session",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    -- 打开最近编辑的文件
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Create Project                      ",
    -- 创建项目
    action = "CMake create_project",
  },
  {
    icon = "  ",
    desc = "Edit keybindings                    ",
    -- 打开快捷键配置文件
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Delete Sessions                     ",
    -- 删除一个session
    action = "SessionManager delete_session",
  },
}

db.custom_header = {
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
[[ ██████╗ ██████╗ ███╗   ██╗██████╗ ]],
[[██╔════╝██╔═══██╗████╗  ██║██╔══██╗]],
[[██║     ██║   ██║██╔██╗ ██║██████╔╝]],
[[██║     ██║▄▄ ██║██║╚██╗██║██╔══██╗]],
[[╚██████╗╚██████╔╝██║ ╚████║██████╔╝]],
[[╚═════╝ ╚══▀▀═╝ ╚═╝  ╚═══╝╚═════╝]],
  [[]],
  [[]],
}






