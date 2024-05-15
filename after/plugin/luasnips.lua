-- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#add-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- To add support for javascript react snippets
-- TODO: Might be able to add for typescript react additionally
-- Reference: https://www.reddit.com/r/neovim/comments/qotoa2/react_snippets_with_l3mon4d3luasnip_in_neovim/
require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })

require('luasnip').filetype_extend("typescript", { "typescriptreact" }) -- Not working
require('luasnip').filetype_extend("typescript", { "html" }) -- Not working

