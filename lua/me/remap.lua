vim.g.mapleader = "," -- Looks like leader should be declared before usage
-- vim.g.user_emmet_leader_key = '.'
-- vim.g.user_emmet_expandabbr_key = "<C-x>" -- Looks like leader should be declared before usage
vim.g.user_emmet_expandabbr_key = "<C-x>" -- Looks like leader should be declared before usage
-- vim.g.user_emmet_settings = { 'html':{'quote_char':\"'\"}, 'javascript':{'quote_char':\"'\"} }
-- let g:user_emmet_settings = {'html':{'quote_char':"'"},'javascript':{'quote_char':"'"}}
-- Below  user_emmet_settings not working
-- vim.g.user_emmet_settings = {
--     javascript = {
--         attributes = {
--             name = "'${1}'",
--             id = "'${2}'",
--             -- class = "'${3}'",
--             value = "'${4}'",
--             -- class = 'className'
--         },
--         quote_char = "'",
--     },
--     jsx = {
--         attributes = {
--             class = 'className'
--         }
--     },
--     typescript = {
--         extends = 'tsx'
--     }
-- }
--

vim.g.user_emmet_settings = {
    javascript = {
        quote_char = "'",
        extends = 'jsx', --To replace 'class' with 'className' for React
    },
    -- Below code not verified yet
    javascriptreact = {
        quote_char = "'"
    },
    typescript = {
        quote_char = "'",
        extends = 'tsx',
    },
    typescriptreact = {
        quote_char = "'",
    }
}


vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- Split function
--vim.keymap.set("n", "\'\'", vim.cmd(":vs"))
--vim.keymap.set("n", "<C-s>", vim.cmd.w)

-- Line Numbers


vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("i", "<C-s>", function ()
	--vim.cmd("<Esc>") -- Unable to get this line to work. Hence adding the below line
	vim.api.nvim_input("<Esc>:w<CR>")
end)

vim.api.nvim_set_keymap('n', '<Tab>', '<C-W><C-W>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', "''", ':vsplit<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', "\"\"", ':split<CR>', {noremap = true, silent = true})


-- For remap doubts
-- https://www.youtube.com/watch?v=w7i4amO_zaE&list=PLhOOcOi09vxUvXE8deqS2JZHnhHCbN3lh&index=2&t=1464s

-- Move highlighted lines (also auto indents)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor remains in same place while appending the below line
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Cursor in middle while jumping
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Cursor in middle while jumping
vim.keymap.set("n", "n", "nzzzv") -- Cursor in middle while jumping
vim.keymap.set("n", "N", "Nzzzv") -- Cursor in middle while jumping

-- On delete and pasting, the deleted text is put into void registry
-- and hence you don't lose your copied word
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copies text into system clipboard
-- TODO: Reconsider whether to always copy into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-c>", function ()
    vim.api.nvim_input("gcc")
end)

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Will start replacing the word you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- For folding
vim.keymap.set("n", "<Space>", function ()
	vim.api.nvim_input("za")
end, { noremap = true })
vim.keymap.set("n", "<C-Space>", function ()
	vim.api.nvim_input("zR")
end, { noremap = true })
vim.keymap.set("n", "<leader>ycn", function ()
	vim.api.nvim_input("^/className<CR>wwyi\'")
end, { noremap = true })

--Reload Configuration
vim.api.nvim_set_keymap('n', '<leader>rc', ':luafile ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })

-- Function to toggle between relative number, number, and no number
function toggle_line_numbers()
    -- vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = not vim.wo.relativenumber
end

-- Map a key to trigger the toggle
vim.keymap.set(
    'n',
    '<leader>tn',
    [[:lua toggle_line_numbers()<CR>]],
    {desc='Toggle line number modes'}
)

--For LuaSnip
-- local ls = require("luasnip")
-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})

-- Lua function to insert a blank line above the current line without moving the cursor
local function insert_blank_line_above(direction)
    -- Save the current cursor position
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    
    if direction == 'above' then
        -- Insert a new line above the current line
        vim.api.nvim_buf_set_lines(0, row-1, row-1, false, {""})
        row = row + 1
    elseif direction == 'below' then
        vim.api.nvim_buf_set_lines(0, row, row, false, {""})
    end
    -- Restore the cursor to the original position
    vim.api.nvim_win_set_cursor(0, {row, col})
end

-- Set the keymap in normal mode
vim.keymap.set('n', '[<Space>', '', { callback=function() insert_blank_line_above('above') end})
vim.keymap.set('n', ']<Space>', '', { callback=function() insert_blank_line_above('below') end})

-- Increase width of the current split (not working)
-- vim.keymap.set('n', '<Leader>+', ':vertical resize +5<CR>', {desc='Increase width of current split'})

-- Decrease width of the current split
-- vim.keymap.set('n', '<Leader>-', ':vertical resize -5<CR>', {desc='Decrease width of current split'})

-- Increase height of the current split by 5 lines
-- vim.keymap.set('n', '<Leader>t', ':resize +5<CR>')

-- Decrease height of the current split by 5 lines
-- vim.keymap.set('n', '<Leader>s', ':resize -5<CR>')

-- These mappings control the size of splits (height/width) Doesn't work. Need to check why
vim.keymap.set("n", "<M-,>", "<c-w>5<")
vim.keymap.set("n", "<M-.>", "<c-w>5>")
vim.keymap.set("n", "<M-t>", "<C-W>+")
vim.keymap.set("n", "<M-s>", "<C-W>-")
vim.keymap.set("n", "<M-s>", "<C-W>-")

vim.keymap.set("n", "<leader>db", ":DBUI<CR>")
