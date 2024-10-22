local builtin = require('telescope.builtin')
local actions = require("telescope.actions")


-- Function to dynamically switch between 'git_files' and 'find_files'
local function project_files()
    local opts = {} -- You can pass options here if needed
    local is_git_repo = vim.fn.system('git rev-parse --is-inside-work-tree')

    if vim.v.shell_error == 0 then
        -- If inside a git repo, search for Git-tracked files
        builtin.git_files(opts)
    else
        -- If not a git repo, search for regular files
        builtin.find_files(opts)
    end
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc='Search all files in folder'})
--Disabling as for some reason Ctrl + p is causing delay in opening window
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<C-;>', builtin.git_files, {})
-- vim.keymap.set('n', '<C-;>', builtin.git_files, {})
--  Windows specific configuration below
vim.keymap.set('n', '<A-;>', builtin.git_files, { desc='Search for files in git' })
-- Map the function to a keybinding (e.g., Alt-;)
vim.keymap.set('n', '<A-;>', project_files, { desc = 'Search project files intelligently' })

vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc='Live grep search for project' } )
vim.keymap.set('n', '<leader>qf', builtin.quickfix, { desc='Open quickfix list' })
-- vim.keymap.set('n', '<leader>ps', function()
-- builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
-- vim.api.nvim_set_keymap('n',
--     '<C-r>',
--     [[<cmd>lua require('telescope.actions').reload()<CR>]],
--     { noremap = true, silent = true }
-- )
vim.keymap.set('n', '<leader>km', ':Telescope keymaps<CR>', {desc='Open Telescope keymaps'})

require("telescope").setup({
    defaults = {
        sorting_strategy = 'ascending',  -- Keeps the top result selected as you type
        dynamic_preview_title = true,
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<leader>ttp'] = require('telescope.actions.layout').toggle_preview
            },
        },
        -- vimgrep_arguments = {
        --     'rg',
            -- '--hidden',           -- Search hidden files
            -- '--no-heading',
            -- '--with-filename',
            -- '--line-number',
            -- '--column',
            -- '--smart-case',
            -- '--ignore-file', '.gitignore', -- Use .gitignore to skip files
            -- '--ignore-dir', 'build',       -- Additionally ignore 'build' directory
            -- '--ignore-dir', 'logs'         -- Additionally ignore 'logs' directory
        -- },
        -- vimgrep_arguments = vim.tbl_extend('force', require('telescope.config').values.vimgrep_arguments, {
        --     '--ignore-dir', 'node_modules',
        --     '--ignore-dir', 'dist',
        -- })

    },
    color_devicons = true,
    -- pickers = {
    --     find_files = { }
    -- },
    preview = {
        hide_on_startup = false     -- hide previewer when picker starts
    }
})

