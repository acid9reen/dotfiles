require("config.set")
require("config.remap")

require("config.lazy")
require("config.lsp")
require("snippets.python")

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h11"
end
