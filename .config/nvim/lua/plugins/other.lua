return {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {},
    },
    {
        "cappyzawa/trim.nvim",
        ft_blocklist = {"markdown"},
        opts = {},
    },
}
