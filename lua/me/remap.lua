vim.g.mapleader = " " -- Looks like leader should be declared before usage
-- vim.g.user_emmet_expandabbr_key = "<C-x>" -- Looks like leader should be declared before usage
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- Split function
--vim.keymap.set("n", "\'\'", vim.cmd(":vs"))
--vim.keymap.set("n", "<C-s>", vim.cmd.w)

-- Line Numbers


vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("i", "<C-s>", function ()
	--vim.cmd("<Esc>") -- Unable to get this line to work. Hence adding the below line
	vim.api.nvim_input("<Esc>")
	vim.cmd("w")
end)

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

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")
-- vim.keymap.set("n", "<C-c>",vim.cmd.gcc )

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
