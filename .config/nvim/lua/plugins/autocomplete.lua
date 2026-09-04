return {
  "saghen/blink.cmp",
  dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = false,
      ["<S-Tab>"] = false,
    },
    -- fuzzy = {
    --   sorts = {
    --     "exact",
    --     "score",
    --     "sort_text",
    --   },
    -- },
    snippets = { preset = "luasnip" },
    completion = {
      accept = { auto_brackets = { enabled = false } },
      menu = {
        auto_show = false,
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      ghost_text = {
        enabled = false,
        show_with_menu = false,
      },
    },
    sources = {
      default = { "lsp", "snippets", "buffer" },
      per_filetype = {
        sql = { "snippets", "dadbod", "buffer" },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
    },
  },
}
