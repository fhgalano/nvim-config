return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered({scrolloff = 100, col_offset = -100}),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<c-n>'] = cmp.mapping.select_next_item(),
              ['<c-p>'] = cmp.mapping.select_prev_item(),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            }, {
              { name = 'buffer' },
            })
        })


        -- TODO: Find way to generate servers list from installed files
        local servers = require('lspserverlist')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        for lsp, settings in pairs(servers) do
            if lsp ~= "rust_analyzer" then
                settings.capabilities = vim.tbl_deep_extend('force', {}, capabilities, settings.capabilities or {})
                require('lspconfig')[lsp].setup(settings)
            end
        end
    end
}
