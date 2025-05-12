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
      yamlfix = {
        env = {
          YAMLFIX_SECTION_WHITELINES = "1",
          YAMLFIX_SEQUENCE_STYLE = "keep_style",
          YAMLFIX_LINE_LENGTH = "100",
          YAMLFIX_NONE_REPRESENTATION = "~",
          YAMLFIX_QUOTE_REPRESENTATION = '"',
          YAMLFIX_PRESERVE_QUOTES = "true",
        },
      },
      sql_formatter = {
        prepend_args = {
          "--config",
          "/home/ruslan/.config/sql-formatter/config.json",
        },
      },
      djlint = {
        prepend_args = {
          "--line-break-after-multiline-tag",
          "--max-blank-lines",
          "1",
          "--max-line-length",
          "120",
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
      html = { "djlint" },
      cpp = { "clang-format" },
      gotmpl = { "djlint" },
    },
  },
  keys = {
    { "<leader>ff", function() require("conform").format() end, mode = { "n", "v" }, desc = "Format" },
  },
}
