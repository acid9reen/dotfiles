return {
  "stevearc/conform.nvim",
  lazy = true,
  opts = {
    formatters = {
      injected = {
        options = {
          ignore_errors = true,
        },
      },
      sql_formatter = {
        args = {
          "--language",
          "postgresql",
        },
      },
    },
    formatters_by_ft = {
      go = { "goimports", "gofmt" },
      json = { "jq" },
      lua = { "stylua" },
      markdown = { "mdformat" },
      python = { "ruff_format" },
      sql = { "sql_formatter" },
      tex = { "latexindent" },
      yaml = { "yamlfix" },
    },
  },
  keys = {
    { "<leader>ff", function() require("conform").format() end, mode = { "n", "v" }, desc = "Format" },
  },
}
