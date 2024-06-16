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
    pylsp = {
        settings = {
            python = {
                analysis = {
                    -- Ignore all files for analysis to exclusively use Ruff for linting
                    ignore = { '*' },
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
                },
            },
        },
    },
}

return serverlist
