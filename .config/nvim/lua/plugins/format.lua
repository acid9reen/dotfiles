return {
  "stevearc/conform.nvim",
  lazy = true,
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofumpt" },
      json = { "jq" },
      lua = { "stylua" },
      markdown = { "mdformat" },
      python = { "ruff_format" },
      tex = { "latexindent" },
      yaml = { "yamlfix" },
    },
  },
  keys = {
    { "<leader>ff", function() require("conform").format() end, mode = { "n", "v" }, desc = "Format" },
  },
}
