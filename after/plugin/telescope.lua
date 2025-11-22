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

-- Preferred project files shortcut
vim.keymap.set('n', '<leader>pp', project_files, { desc = 'Project files' })

vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc='Live grep search for project' } )
vim.keymap.set('n', '<leader>km', ':Telescope keymaps<CR>', {desc='Open Telescope keymaps'})

vim.keymap.set('n', '<leader>qf', builtin.quickfix, { desc='Open quickfix list' })
vim.keymap.set('n', '<leader>qh', builtin.quickfixhistory, { desc='Open quickfix list' })
vim.keymap.set('n', ']q', ':cnext<CR>', { noremap = true, silent = true, desc = 'Next quickfix entry' })
vim.keymap.set('n', '[q', ':cprev<CR>', { noremap = true, silent = true, desc = 'Previous quickfix entry' })
vim.keymap.set('n', ']Q', ':cnewer<CR>', { noremap = true, silent = true, desc = 'Next quickfix list' })
vim.keymap.set('n', '[Q', ':colder<CR>', { noremap = true, silent = true, desc = 'Previous quickfix list' })


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
        previewer = false,
    },
    color_devicons = true,
    -- pickers = {
    --     find_files = { }
    -- },
    preview = {
        hide_on_startup = true     -- hide previewer when picker starts
    }
})

-- To remove folding of results (added this because when indent is set as 2. The results from Telescope are folded)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopeResults",
    callback = function()
        vim.opt_local.foldenable = false
    end
})
