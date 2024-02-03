vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = 'Open netrw'})

require("set")
require("remap")

require("config.lazy")

require("lsp")
require('Comment').setup()
require('trim').setup {
    ft_blocklist = {"markdown"},
}
