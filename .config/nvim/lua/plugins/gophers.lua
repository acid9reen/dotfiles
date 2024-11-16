return {
  {
    "olexsmir/gopher.nvim",
    build = function() vim.cmd([[GoInstallDeps]]) end,
    opts = {},
  },
}
