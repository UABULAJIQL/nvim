-- git变化查看
local status, diffview = pcall(require, "diffview")
if not status then
    vim.notify("没有找到 diffview")
    return
end
local actions = require("diffview.actions")

diffview.setup({

    diff_binaries = false, -- Show diffs for binaries
    enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
    git_cmd = { "git" }, -- The git executable followed by default args.
    use_icons = true, -- Requires nvim-web-devicons
    icons = { -- Only applies when use_icons is true.
        folder_closed = "",
        folder_open = "",
    },
    signs = {
        fold_closed = "",
        fold_open = "",
    },
    file_panel = {
        listing_style = "tree", -- One of 'list' or 'tree'
        tree_options = { -- Only applies when listing_style is 'tree'
            flatten_dirs = true, -- Flatten dirs that only contain one single dir
            folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
        },
        win_config = { -- See ':h diffview-config-win_config'
            position = "left",
            width = 35,
        },
    },
    file_history_panel = {
        log_options = { -- See ':h diffview-config-log_options'
            single_file = {
                diff_merges = "combined",
            },
            multi_file = {
                diff_merges = "first-parent",
            },
        },
        win_config = { -- See ':h diffview-config-win_config'
            position = "bottom",
            height = 16,
        },
    },
    commit_log_panel = {
        win_config = {}, -- See ':h diffview-config-win_config'
    },
    default_args = { -- Default args prepended to the arg-list for the listed commands
        DiffviewOpen = {},
        DiffviewFileHistory = {},
    },
    hooks = {}, -- See ':h diffview-config-hooks'
    keymaps = require("keybindings").diffviewList(actions)

})
