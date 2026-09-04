local ls = require("luasnip")
local s = ls.snippet
local c = ls.choice_node
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local werr = s(
  "werr",
  fmt(
    [[
    if err != nil {{
        return {}fmt.Errorf("{}: %w", err)
    }}
    ]],
    {
      i(1, ""),
      i(2, "message"),
    }
  )
)

local forr = s(
  "forr",
  fmt(
    [[
    for {}, {} := range {} {{
    	  {}
    }}
    ]],
    {
      i(1, "key"),
      i(2, "value"),
      i(3, "collection"),
      i(4, ""),
    }
  )
)

local stmt = s(
  "stmt",
  fmt(
    [[
    stmt := `
    {}
    `
    ]],
    {
      i(1, ""),
    }
  )
)

local map = s(
  "map",
  fmt(
    [[
    {} := make(map[{}]{}, len({}))
    for _, {} := range {} {{
        {}[{}.{}] = {}
    }}
    ]],
    {
      i(1, "mapping"),
      i(2, "keyType"),
      i(3, "valueType"),
      i(4, "collection"),
      i(5, "value"),
      rep(4),
      rep(1),
      rep(5),
      i(6, "ID"),
      rep(5),
    }
  )
)

local ctx = s("ctx", t("ctx context.Context"))

ls.add_snippets("go", {
  werr,
  forr,
  stmt,
  ctx,
  map,
})
