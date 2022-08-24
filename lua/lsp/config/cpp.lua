return {
    on_setup = function(server)
        server:setup({

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
                -- require('illuminate').on_attach(client)
                require('aerial').on_attach(client, bufnr)
            end,

        })
    end,
}
