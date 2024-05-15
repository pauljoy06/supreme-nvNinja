local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}), --Can set select to true if first item should be used for auto-complete without selection.
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

