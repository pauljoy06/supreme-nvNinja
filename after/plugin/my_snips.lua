local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

-- Define a simple snippet
ls.add_snippets(
  'all',  {
    s('impr', {
      t("import React from 'react';"),
    })
  }
)
