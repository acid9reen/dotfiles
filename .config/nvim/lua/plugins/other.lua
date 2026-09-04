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
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "mattn/emmet-vim",
    init = function()
      vim.g.user_emmet_leader_key = "<C-Z>"
      vim.g.user_emmet_settings = {
        html = {
          indentation = "    ",
        },
      }
    end,
  },
  {
    "jasonwoodland/vim-html-indent",
  },
  { "nvim-mini/mini.indentscope", version = false, config = true },
  { "nvim-tree/nvim-web-devicons", config = true },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- Completion for `blink.cmp`
    dependencies = { "saghen/blink.cmp" },
  },
  { "nvim-mini/mini.align", version = false, config = true },
}
