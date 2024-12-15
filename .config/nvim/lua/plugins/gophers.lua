return {
  {
    "olexsmir/gopher.nvim",
    build = function() vim.cmd([[GoInstallDeps]]) end,
    lazy = true,
    ft = { "go" },
    config = true,
  },
}
