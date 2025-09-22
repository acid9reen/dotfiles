return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
      },
      extensions = {
        "fugitive",
        "mason",
        "oil",
        "quickfix",
        "symbols-outline",
        "lazy",
      },
      sections = {
        lualine_a = {
          function() return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") end,
        },
        lualine_b = {
          "branch",
          { "filename", path = 1 },
          "diff",
          "diagnostics",
        },
        lualine_c = {
          "lsp_status",
        },
        lualine_x = { "encoding", "fileformat" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
