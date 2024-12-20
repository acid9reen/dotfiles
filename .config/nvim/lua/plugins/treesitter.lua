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
        "make",
        "markdown",
        "python",
        "rst",
        "sql",
        "toml",
        "yaml",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
