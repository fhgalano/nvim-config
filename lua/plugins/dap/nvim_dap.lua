return {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Start/Continue' })
            vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into' })
            vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Debug: Step Over' })
            vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Debug: Step Out' })
            vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
            vim.keymap.set('n', '<leader>dB', function()
                dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end, { desc = "Debug: Set Conditional Breakpoint"})
            vim.keymap.set('n', '<leader>dq', dap.stop, { desc = 'Debug: Quit' })
            vim.keymap.set('n', '<leader>dr', dap.restart, { desc = 'Debug: Restart' })
        end
}
