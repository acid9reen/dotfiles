vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable spellcheck on text files",
  pattern = { "html", "markdown", "text", "tex", "rst", "gitcommit" },
  callback = function() vim.opt_local.spell = true end,
})

vim.api.nvim_create_augroup("inlay_toggle", { clear = true })
local inlay_hint_was_enabled = true
vim.api.nvim_create_autocmd("InsertEnter", {
  desc = "Disable inlay hints in insert mode",
  group = "inlay_toggle",
  callback = function()
    inlay_hint_was_enabled = vim.lsp.inlay_hint.is_enabled()
    vim.lsp.inlay_hint.enable(false)
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  desc = "Restore inlay hints mode on leaving insert mode",
  group = "inlay_toggle",
  callback = function()
    if inlay_hint_was_enabled then vim.lsp.inlay_hint.enable(true) end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Hide line numbers for terminal buffers",
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
