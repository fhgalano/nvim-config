return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = {
            { '\\\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
            { '\\gs', ':Neotree git_status<CR>', { desc = 'NeoTree [G]it [S]tatus' } },
            { '\\x', ':Neotree close<CR>', { desc = "Neotree [C]lose" } },
        },
        window = {
            mappings = {
              ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            }
        },
        opts = {
            filesystem = {
                window = {
                    mappings = {
                        ['\\\\'] = "close_window",
                    }
                }
            }
        },
    }
}
