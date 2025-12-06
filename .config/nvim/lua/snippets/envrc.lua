local ls = require("luasnip")
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta

local python = s(
  "python",
  fmta(
    [[
    export VIRTUAL_ENV=.venv
    layout python3
    ]],
    {},
    {
      indent_string = "    ",
    }
  )
)

local flake = s(
  "flake",
  fmta(
    [[
    use flake
    ]],
    {},
    {
      indent_string = "    ",
    }
  )
)

local dotenv = s(
  "dotenv",
  fmta(
    [[
    dotenv
    ]],
    {},
    {
      indent_string = "    ",
    }
  )
)

ls.add_snippets("sh", {
  python,
  flake,
  dotenv
})
