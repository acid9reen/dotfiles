-- Status loader for lsp
return {
  "j-hui/fidget.nvim",
  config = true,
  lazy = true,
  event = { "LspAttach" },
}
