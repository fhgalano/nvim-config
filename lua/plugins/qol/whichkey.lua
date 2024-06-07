return {
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("which-key").setup()

            require("which-key").register({
                ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
            })
        end
    },
}
