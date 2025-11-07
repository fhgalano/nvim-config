return {
    {
        "williamboman/mason.nvim",
        config = true,
        opts = { ensure_installed = { "debugpy" } }
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local servers = require("lspserverlist")
            local server_names = {}
            for k,_ in pairs(servers) do
                if k ~= "rust_analyzer" then
                    server_names[#server_names+1] = k
                end
            end
            require("mason-lspconfig").setup {
                ensure_installed = server_names,
            }
        end
    },
}
