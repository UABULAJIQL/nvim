-- c#lsp已经移除了这个配置文件暂时留着
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

return {
    on_setup = function(server)
        server:setup({
            -- omnisharp = {
            --     projectLoadTimeout = 1
            --
            -- },


            -- 启用mono
            use_mono = true,

            -- Enables support for reading code style, naming convention and analyzer
            -- settings from .editorconfig.
            enable_editorconfig_support = true,

            -- If true, MSBuild project system will only load projects for files that
            -- were opened in the editor. This setting is useful for big C# codebases
            -- and allows for faster initialization of code navigation features only
            -- for projects that are relevant to code that is being edited. With this
            -- setting enabled OmniSharp may load fewer projects and may thus display
            -- incomplete reference lists for symbols.
            -- 加载编辑器打开中搜需要的资源不需要把整个项目的资源全部加载
            enable_ms_build_load_projects_on_demand = true,

            -- Enables support for roslyn analyzers, code fixes and rulesets.
            enable_roslyn_analyzers = false,

            -- Specifies whether 'using' directives should be grouped and sorted during
            -- document formatting.
            organize_imports_on_format = false,

            -- Enables support for showing unimported types and unimported extension
            -- methods in completion lists. When committed, the appropriate using
            -- directive will be added at the top of the current file. This option can
            -- have a negative impact on initial completion responsiveness,
            -- particularly for the first few completion sessions after opening a
            -- solution.
            enable_import_completion = false,

            -- Specifies whether to include preview versions of the .NET SDK when
            -- determining which version to use for project loading.
            sdk_include_prereleases = true,

            -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
            -- true
            analyze_open_documents_only = false,

            capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
            flags = {
                debounce_text_changes = 150,
            },
            on_attach = function(client, bufnr)
                -- 禁用格式化功能，交给专门插件插件处理
                -- client.resolved_capabilities.document_formatting = false --已弃用
                -- client.resolved_capabilities.document_range_formatting = false --已弃用

                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end

                -- 绑定快捷键
                require('keybindings').mapLSP(buf_set_keymap)
                -- 保存时自动格式化
                --vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')

                -- 支持下面这两个插件
                require('illuminate').on_attach(client)
                require('aerial').on_attach(client, bufnr)
            end,

        })
    end
}
