local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep

local function get_prop_names(id_node)
  local object_type_node = id_node:child(3)

  if object_type_node:type() ~= "object_type" then
    return {}
  end

  local prop_names = {}

  for prop_signature in object_type_node:iter_children() do
    if prop_signature:type() == "property_signature" then
      local prop_iden = prop_signature:child(0)
      local prop_name = vim.treesitter.query.get_node_text(prop_iden, 0)
      prop_names[#prop_names + 1] = prop_name
    end
  end

  return prop_names
end

ls.add_snippets("typescriptreact", {
  s(
    "comp",
    fmt(
      [[
type {}Props = {{
  {}
}}

export const {} = ({{{}}}: {}Props) => {{
  return <div>{}</div>
}}
]],
      {
        d(1, function(_, snip)
          return sn(nil, {
            i(1, vim.fn.substitute(snip.env.TM_FILENAME, "\\..*$", "", "g")),
          })
        end ),
        i(2, "// name: string;"),
        rep(1),
        f(function(_, snip, _)
          local pos_begin = snip.nodes[6].mark:pos_begin()
          local pos_end = snip.nodes[6].mark:pos_end()
          local parser = vim.treesitter.get_parser(0, "tsx")
          local tstree = parser:parse()

          local node = tstree[1]
            :root()
            :named_descendant_for_range(pos_begin[1], pos_begin[2], pos_end[1], pos_end[2])

          while node ~= nil and node:type() ~= "type_alias_declaration" do
            node = node:parent()
          end

          if node == nil then
            return ""
          end

          -- `node` is now surely of type "interface_declaration"
          local prop_names = get_prop_names(node)

          -- Does this lua->vimscript->lua thing cause a slow down? Dunno.
          return vim.fn.join(prop_names, ", ")
        end, { 2 }),
        rep(1),
        i(3, "")
      }
    )
  ),
})

