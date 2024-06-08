return {
    { "williamboman/mason.nvim", config = true },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local servers = require("lspserverlist")
            require("mason-lspconfig").setup {
                ensure_installed = servers,
            }
        end
    },
}
