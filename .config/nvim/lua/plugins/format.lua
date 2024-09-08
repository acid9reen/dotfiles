return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      json = { "jq" },
      lua = { "stylua" },
      python = { "ruff_format" },
      tex = { "latexindent" },
      yaml = { "yamlfix" },
      md = { "mdformat" },
      go = { "gofmt" },
    },
  },
  keys = {
    { "<leader>ff", function() require("conform").format() end, mode = { "n", "v" }, desc = "Format" },
  },
}
