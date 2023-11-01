require('lualine').setup({
    sections = {
        -- https://github.com/nvim-lualine/lualine.nvim#filename-component-options
        lualine_c = {
            {
                'filename',
                path = 4,
            }
        }
    }
})
