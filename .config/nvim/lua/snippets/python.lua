local ls = require("luasnip")
local s = ls.snippet
local c = ls.choice_node
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

-- main function stub
local main = s(
  "mn",
  fmt(
    [[
    def {}() -> int:
        {}

        return 0


    if __name__ == "__main__":
        raise SystemExit({}())
    ]],
    {
      i(2, "main"),
      i(1, ""),
      rep(2),
    }
  )
)

-- async main function stub
local amain = s(
  "amn",
  fmt(
    [[
    import asyncio


    async def {}() -> int:
        {}

        return 0


    def {}() -> int:
        asyncio.run({}())

        return 0


    if __name__ == "__main__":
        raise SystemExit({}())
    ]],
    {
      i(2, "main_coro"),
      i(1, ""),
      i(3, "main"),
      rep(2),
      rep(3)
    }
  )
)

-- TypeVar declaration
local typevar = s(
  "tv",
  fmt(
    [[
    {} = tp.TypeVar("{}")
    ]],
    {
      i(1, "_T"),
      rep(1),
    }
  )
)

-- typed decorator
local typed_decorator = s(
  "deco",
  fmt(
    [[
    _P = tp.ParamSpec("_P")
    _RT = tp.TypeVar("_RT")
    def {}(func: tp.Callable[_P, _RT]) -> tp.Callable[_P, _RT]:
        @wraps(func)
        def wrapper(*args: _P.args, **kwargs: _P.kwargs) -> _RT:
            result = func(*args, **kwargs)

            return result
        return wrapper
    ]],
    { i(0, "deco") }
  )
)

-- basic logger config with some custom formatting
local logger = s(
  "blog",
  fmt(
    [[
    logging.basicConfig(
        level=logging.{},
        format='[%(asctime)s] %(levelname)-8s [%(name)s:%(lineno)s] %(message)s',
        handlers=[
            {},
        ],
    )
    ]],
    {
      c(1, {t "INFO", t "DEBUG", t "CRITICAL"}),
      c(2, {t "logging.StreamHandler(sys.stderr)", t "logging.NullHandler()"})
    }
    )
  )

ls.add_snippets("python", {
  amain,
  main,
  typevar,
  typed_decorator,
  logger,
})
