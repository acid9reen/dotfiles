local cmp = require("cmp")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql" },
  callback = function(_) cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } }) end,
})
