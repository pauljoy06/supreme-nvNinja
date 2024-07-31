-- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#add-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- To add support for javascript react snippets
-- TODO: Might be able to add for typescript react additionally
-- Reference: https://www.reddit.com/r/neovim/comments/qotoa2/react_snippets_with_l3mon4d3luasnip_in_neovim/
require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })

require('luasnip').filetype_extend("typescript", { "typescriptreact" }) -- Not working
require('luasnip').filetype_extend("typescript", { "html" }) -- Not working

require('luasnip.loaders.from_lua').load({ paths = './my_snips.lua' })

local ls = require('luasnip')

vim.keymap.set({"i"}, "<C-k>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-l>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump(-1) end, {silent = true})

-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})
