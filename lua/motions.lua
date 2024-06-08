-- configuration for more global or non-plugin-specific command maps
--
-- Window Navigation
vim.keymap.set('n', '<c-j>', '<c-w><c-j>', {desc = "move to window above" })
vim.keymap.set('n', '<c-k>', '<c-w><c-k>', {desc = "move to window below" })
vim.keymap.set('n', '<c-h>', '<c-w><c-h>', {desc = "move to window left" })
vim.keymap.set('n', '<c-l>', '<c-w><c-l>', {desc = "move to window right" })

-- Editing Overrides
-- vim.keymap.set('n', '<s-cr>', 'o<esc>', { desc = "add newline while remaining normal" })
-- NOTE: Mapping <s-cr> or <c-cr> is generally not possible because of how the terminal receives that input
-- this is not the case for gvim instances (i.e. vim in jetbrains IDEs)
vim.keymap.set('n', 'N', 'o<esc>', { desc = "add newline while remaining normal" })
