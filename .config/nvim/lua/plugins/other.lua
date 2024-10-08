return {
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  "saadparwaiz1/cmp_luasnip",
  {
    "cappyzawa/trim.nvim",
    ft_blocklist = { "markdown" },
    opts = {},
  },
  { "echasnovski/mini.indentscope", version = false, opts = {} },
  { "tpope/vim-surround" },
  { "MunifTanjim/nui.nvim", lazy = true },
  { "echasnovski/mini.icons", version = false },
  {
    "echasnovski/mini.align",
    version = false,
    opts = {},
  },
  {
    -- Status loader for lsp
    "j-hui/fidget.nvim",
    opts = {},
  },
  { "vim-dadbod-completion" },
}
