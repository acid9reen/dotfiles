return {
  "danymat/neogen",
  lazy = true,
  cmd = { "Neogen" },
  opts = {
    snippet_engine = "luasnip",
    languages = {
      python = {
        template = {
          annotation_convention = "numpydoc",
        },
      },
    },
  },
}
