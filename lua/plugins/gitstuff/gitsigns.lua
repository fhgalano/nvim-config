return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged_enabled = true,
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            follow_files = true
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
    },
    keys = {
        { '\\gdf', ':Gitsigns diffthis<CR>', { desc = '[G]itsigns [D]iff [F]ile' } },
        { '\\gsh', ':Gitsigns stage_hunk<CR>', { desc = '[G]itsigns [S]tage [H]unk' } },
        { '\\gsf', ':Gitsigns stage_buffer<CR>', { desc = '[G]itsigns [S]tage [F]ile' } },
        { '\\grh', ':Gitsigns reset_hunk<CR>', { desc = '[G]itsigns [R]eset [H]unk' } },
        { '\\grf', ':Gitsigns reset_buffer<CR>', { desc = '[G]itsigns [R]eset [F]ile' } },
        { '\\gph', ':Gitsigns preview_hunk_inline<CR>', { desc = '[G]itsigns [P]review [H]unk' } },
        { '\\ggn', ':Gitsigns next_hunk<CR>', { desc = '[G]itsigns [G]o [N]ext_hunk' } },
        { '\\ggp', ':Gitsigns next_hunk<CR>', { desc = '[G]itsigns [G]o [P]rev_hunk' } },
    },
    lazy = false,
}
