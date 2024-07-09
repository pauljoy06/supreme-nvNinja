local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--Disabling as for some reason Ctrl + p is causing delay in opening window
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<C-;>', builtin.git_files, {})
-- vim.keymap.set('n', '<C-;>', builtin.git_files, {})
--  Windows specific configuration below
vim.keymap.set('n', '<A-;>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep)
-- vim.keymap.set('n', '<leader>ps', function()
-- builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
-- vim.api.nvim_set_keymap('n',
--     '<C-r>',
--     [[<cmd>lua require('telescope.actions').reload()<CR>]],
--     { noremap = true, silent = true }
-- )

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<leader>ttp'] = require('telescope.actions.layout').toggle_preview
            },
        },
    },
    color_devicons = true,
    -- pickers = {
    --     find_files = { }
    -- },
    preview = {
        hide_on_startup = false     -- hide previewer when picker starts
    }
})

