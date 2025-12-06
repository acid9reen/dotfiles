return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
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
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
