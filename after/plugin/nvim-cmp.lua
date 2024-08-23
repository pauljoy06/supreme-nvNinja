local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
     --Can set select to true if first item should be used for auto-complete without selection.
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }),
  -- To preselect the first item in the available list
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
})

-- Setup vim-dadbod
cmp.setup.filetype({ 'sql' }, {
    sources = {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
    },
})

-- If you want insert `(` after select function or method item
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
