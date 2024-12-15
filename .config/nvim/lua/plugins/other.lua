return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
  },
  {
    "cappyzawa/trim.nvim",
    ft_blocklist = { "markdown" },
    config = true,
  },
  { "tpope/vim-surround" },
  { "MunifTanjim/nui.nvim", lazy = true },
}
