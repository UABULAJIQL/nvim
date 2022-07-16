return {
    on_setup = function(server)
        server:setup({

            on_attach = function(client, bufnr)
                -- 禁用格式化功能，交给专门插件插件处理
                -- client.resolved_capabilities.document_formatting = false --已弃用
                -- client.resolved_capabilities.document_range_formatting = false --已弃用
                --但是替换成这个会有问题
                --client.server_capabilities.document_formatting = false
                --client.server_capabilities.document_range_formatting = false

                -- 相同单词高亮显示 又是resolved_capabilities这个弃用的东西 服了
                --if client.resolved_capabilities.document_highlight then
                --    vim.api.nvim_exec(
                --        [[
                --            augroup lsp_document_highlight
                --                autocmd! * <buffer>
                --                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                --                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                --            augroup END
                --        ]],
                --        false
                --    )
                --end

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
    end,
}
