-- Initial code built by asking chatgpt how to make a floating window in neovim
-- Create a floating window in Neovim
-- NOTE: '-1' is never valid for buffers and windows. '0' typically refers to current buf/win
local le_state = { buf = -1, win = -1}

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

function create_ferminal_window(opts)
    -- set default for empty opts
    opts = opts or {}

    local height = opts.height or math.floor(vim.o.lines * 0.8)
    local width = opts.width or math.floor(vim.o.columns * 0.8)

    -- Get the current window and buffer
    local current_buf
    if not vim.api.nvim_buf_is_valid(le_state.buf) then
        current_buf = vim.api.nvim_create_buf(true, false)
    else
        current_buf = le_state.buf
    end

    -- Get the screen size (window dimensions)
    local screen_width = vim.api.nvim_get_option('columns')
    local screen_height = vim.api.nvim_get_option('lines')

    -- Calculate the position for the floating window (centering it on screen)
    local row = math.floor((screen_height - height) / 2)
    local col = math.floor((screen_width - width) / 2)

    -- Create a new floating window
    local opts = {
      relative = 'editor',   -- The window is relative to the entire editor
      width = width,         -- Width of the floating window
      height = height,       -- Height of the floating window
      row = row,             -- Row position
      col = col,             -- Column position
      style = 'minimal',     -- Optional: makes the window less cluttered
      border = 'rounded',  -- Border style
      title = 'Terminal',
    }

    -- Open a new floating window
    local win_id = vim.api.nvim_open_win(current_buf, true, opts)

    -- Optionally, set some properties for the floating window
    vim.wo[win_id].wrap = false -- Disable text wrapping
    vim.wo[win_id].cursorline = true -- Enable cursorline

    return { buf = current_buf, win = win_id }
end

local inspect = require("vim.inspect")
vim.api.nvim_create_user_command("Ferminal", function()
    if not vim.api.nvim_win_is_valid(le_state.win) or vim.api.nvim_win_get_config(le_state.win).hide then
        le_state = create_ferminal_window()
        if vim.api.nvim_get_option_value('buftype', { buf = le_state.buf }) ~= "terminal" then
            vim.cmd.terminal()
        end
    elseif vim.api.nvim_win_get_config(le_state.win).hide == false then
        vim.api.nvim_win_hide(le_state.win)
    end
end, {})

return {}
