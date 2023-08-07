local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

vim.keymap.set('n', '<leader>ps', builtin.find_files, {})
--Disabling as for some reason Ctrl + p is causing delay in opening window
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-;>', builtin.git_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep)
-- vim.keymap.set('n', '<leader>ps', function()
-- builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<leader>ttp'] = require('telescope.actions.layout').toggle_preview
            },
        },
        preview = {
            hide_on_startup = false     -- hide previewer when picker starts
        }
    },
})
