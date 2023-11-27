local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = 'Open netrw'})

require("set")
require("remap")

local plugins = require("plugins")
require("lazy").setup(plugins)
require("lsp")
require('Comment').setup()
require('trim').setup {
    ft_blocklist = {"markdown"},
}
