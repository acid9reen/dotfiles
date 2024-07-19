return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")
    local types = require("luasnip.util.types")

    ls.setup({
      history = true,
      update_events = { "TextChanged", "TextChangedI" },
      enable_autosnippets = true,
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "●", "GruvboxOrange" } },
            hl_mode = "combine",
          },
          passive = {
            hl_group = "hl-Substitute",
          },
        },
        [types.insertNode] = {
          active = {
            virt_text = { { "●", "GruvboxAqua" } },
            hl_mode = "combine",
          },
          passive = {
            hl_group = "GruvboxAqua",
          },
        },
      },
    })

    vim.keymap.set({ "i", "s" }, "<C-L>", function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-J>", function()
      ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-K>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end,
}
