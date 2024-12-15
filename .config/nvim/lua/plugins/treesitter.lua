return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufEnter",
    lazy = true,
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "go",
        "lua",
        "markdown",
        "python",
        "sql",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
