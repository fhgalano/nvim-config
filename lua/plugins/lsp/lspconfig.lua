return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                map('<leader>gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                map('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                map('<leader>gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                map('<leader>gt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype')
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')

                vim.keymap.set('i', '<c-space>', vim.lsp.buf.completion, { buffer = event.buf, desc = 'LSP: Code Completion' })

                local client = vim.lsp.get_client_by_id(event.data.client_id)

                if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                    map(
                        '<leader>th',
                        function()
                            ---@diagnostic disable-next-line: missing-parameter
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                        end,
                        '[T]oggle Inlay [H]ints'
                    )
                end
            end
        })

        local servers = require('lspserverlist')
        for lsp, settings in pairs(servers) do
            if lsp ~= "rust_analyzer" then
                require('lspconfig')[lsp].setup(settings)
            end
        end
    end
}
