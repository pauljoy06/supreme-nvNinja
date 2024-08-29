local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

-- Define a simple snippet
ls.add_snippets(
  'all',  {
    s('impr', {
      t("import React from 'react';"),
    })
  }
)


ls.add_snippets("all", {
    s("reactcomp", fmt([[
        import React from 'react';

        const {} = (props) => {{
            return <div className='{}'>
                {}
            </div>
        }}

        export default {};
    ]], {
        i(1, "ComponentName"),
        i(3, "className"),
        i(4, "content"),
        i(2, "ComponentName")  -- This reuses the first insert node
    })),
})


