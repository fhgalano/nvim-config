local serverlist = {
    rust_analyzer = {},
    lua_ls = {},
    ruff = {
        on_attach = function(client, bufnr)
          if client.name == 'ruff' then
            -- Disable hover in favor of pylsp
            client.server_capabilities.hoverProvider = false
          end
        end,
    },
    ts_ls = {
        init_options = {
            preferences = {
                disableSuggestions = true,
            }
        }
    },
    cssls = {},
    html = {},
    pylsp = {
        on_attach = function()
            local neo = require("neotest")

            vim.keymap.set('n', '<leader>rt', neo.run.run, { desc = "[R]un [T]his"})
            vim.keymap.set('n', '<leader>rr', neo.run.run_last, { desc = "[R]un Last"})
            vim.keymap.set('n', '<leader>rf',
                function()
                    neo.run.run(vim.fn.expand("%"))
                end, { desc = "[R]un [F]ile"})

            vim.keymap.set('n', '<leader>dt',
                function()
                    neo.run.run({strategy = "dap"})
                    -- require("dap-python").test_method()
                end, { desc = "[D]ebug [T]his"})
            vim.keymap.set('n', '<leader>dd',
                function()
                    neo.run.run_last({strategy = "dap"})
                end, { desc = "[D]ebug Last"})
        end,
        settings = {
            pyright = {
                -- Using Ruff's import organizer
                disableOrganizeImports = true,
                disableLanguageServices = false,
            },
            python = {
                pythonPath = 'usr/bin/python3',
                analysis = {
                    -- Ignore all files for analysis to exclusively use Ruff for linting
                    -- ignore = { '*' },
                    autoSearchPaths = true,
                    diagnosticMode = 'openFilesOnly',
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = 'off',
                },
            },
            pylsp = {
                plugins = {
                    pycodestyle = {
                        enabled = false
                    },
                    pyflakes = {
                        enabled = false
                    },
                    -- auto-completion options
                    jedi_completion = {
                        fuzzy = true
                    },
                },
            },
        },
    },
}

return serverlist

