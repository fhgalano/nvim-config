return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()

        local cmppath = vim.fn.stdpath("data") .. "/lazy/nvim-cmp.nvim"
        if not (vim.uv or vim.loop).fs_stat(cmppath) then
            require('nvim-autopairs').setup({ map_cr = true })
        else
            require('nvim-autopairs').setup()
            local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
            local cmp = require 'cmp'
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end
    end,
}
