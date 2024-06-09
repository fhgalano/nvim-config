-- do you think you fell out of a coconut tree?? it's all about the context
-- TODO: move the basic vim mapping to its own file
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- you better get those tabs out of my face
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- where am i?
vim.opt.number = true
vim.opt.relativenumber = true

-- remain centered 
vim.opt.scrolloff = 20

-- keymaps
require('motions')


-- it's dangerous to install alone... take this
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
    change_detection = {
        enabled = true,
        notify = false,
    },
}

require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.core" },
    { import = "plugins.qol" },
    { import = "plugins.lsp" },
    { import = "plugins.autocmp" },
    { import = "plugins.dap" },
}, lazy_opts)


-- initializing drip, please wait...
vim.cmd.colorscheme("rose-pine")

vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalNC", {bg = "none"})
