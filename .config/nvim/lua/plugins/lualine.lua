return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "gruvbox",
        globalstatus = true,
      },
      extensions = {
        "fugitive",
        "mason",
        "nvim-dap-ui",
        "oil",
        "quickfix",
        "symbols-outline",
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          "branch",
          { "filename", path = 1 },
          "diff",
          "diagnostics",
        },
        lualine_c = {
          "lsp_status",
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
