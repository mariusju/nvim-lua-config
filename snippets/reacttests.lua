local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep

local filetype = "all"


ls.add_snippets(filetype, {
  s(
    "desc",
    fmt(
      [[
describe("{}", () => {{
  {}
}})
]],
      {
        i(1, ""),
        i(2, ""),
      }
    )
  ),
})

ls.add_snippets(filetype, {
  s(
    "test",
    fmt(
      [[
it("{}", async () => {{
  {}
}})
]],
      {
        i(1, ""),
        i(2, ""),
      }
    )
  ),
})

