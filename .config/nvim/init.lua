vim.g.mapleader = " "

require("user.options")
require("user.filetypes")
require("user.keymaps")
require("user.aucmds")
require("user.lsp")

require("config.lazy")
require("snippets.python")
require("snippets.editorconfig")
require("snippets.envrc")

-- Change kitty window to opened dir
local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
local title = "nvim – " .. cwd
io.write(string.format("\27]2;%s\7", title))
