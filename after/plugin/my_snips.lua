print("my_snips file has started sourcing")
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define a simple snippet
ls.add_snippets(
  "all",  {
    s("trigger", {
      t("This is a custom snippet!"),
      i(1, "Insert text here"),
    }),
    -- You can define more snippets here
  }
)
print("my_snips file has finished sourcing")
