return {
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
        config = function()
            vim.g.rustaceanvim = {
                -- Plugin configuration
                tools = {
                },
                -- LSP configuration
                server = {
                    on_attach = function(client, bufnr)
                    vim.keymap.set(
                        "n",
                        "<leader>a",
                        function()
                          vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
                          -- or vim.lsp.buf.codeAction() if you don't want grouping.
                        end,
                        { silent = true, buffer = bufnr }
                    )
                    -- debug closest
                    vim.keymap.set(
                        "n",
                        "<leader>dt",
                        function()
                            vim.cmd.RustLsp('debug')
                        end,
                        { silent = true, buffer = bufnr }
                    )
                    -- debug last ran thing
                    vim.keymap.set(
                        "n",
                        "<leader>dd",
                        function()
                            vim.cmd.RustLsp{ 'debuggables', bang = true }
                        end,
                        { silent = true, buffer = bufnr }
                    )
                    -- run closest to cursor
                    vim.keymap.set(
                        "n",
                        "<leader>rt",
                        function()
                            vim.cmd.RustLsp('run')
                        end,
                        { silent = true, buffer = bufnr }
                    )
                    -- run last
                    vim.keymap.set(
                        "n",
                        "<leader>rr",
                        function()
                            vim.cmd.RustLsp{ 'runnables', bang = true }
                        end,
                        { silent = true, buffer = bufnr }
                    )
                    end,
                    default_settings = {
                        -- rust-analyzer language server configuration
                        ['rust-analyzer'] = {
                            procMacro = {
                                ignored = {
                                    leptos_macro = {
                                        "server",
                                    },
                                },
                            },
                        },
                    },
                },
            }
        end
    }
}
