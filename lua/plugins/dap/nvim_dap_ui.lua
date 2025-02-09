---@diagnostic disable: missing-fields
return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            local dap, dui = require("dap"), require("dapui")

            dui.setup({
                layouts = {
                    {
                        elements = { {
                            id = "scopes",
                            size = 0.25
                          }, {
                            id = "breakpoints",
                            size = 0.25
                          }, {
                            id = "stacks",
                            size = 0.25
                          }, {
                            id = "watches",
                            size = 0.25
                          } },
                        position = "right",
                        size = 40
                      }, {
                        elements = { {
                            id = "repl",
                            size = 0.5
                          }, {
                            id = "console",
                            size = 0.5
                          } },
                        position = "bottom",
                        size = 10
                      }
                  },
            })
            dap.listeners.before.attach.dapui_config = function()
                dui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dui.open()
            end
            -- dap.listeners.before.event_terminated.dapui_config = function()
            --     dui.close()
            -- end
            -- dap.listeners.before.event_exited.dapui_config = function()
            --     dui.close()
            -- end

            vim.keymap.set("n", "<leader>dx", dui.toggle, { desc= "Debug: Toggle UI" })
        end,
    },
}
