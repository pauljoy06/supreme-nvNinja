-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        tag = '0.1.2' -- or, branch = '0.1.x'packe
    }
    use 'navarasu/onedark.nvim'
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
    use 'ThePrimeagen/harpoon'
    -- use 'mbbill/undotree'

    -- https://github.com/VonHeikemen/lsp-zero.nvim
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
    -- https://github.com/numToStr/Comment.nvim
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'LunarWatcher/auto-pairs'
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use 'andymass/vim-matchup'
    -- https://github.com/mattn/emmet-vim
    use 'mattn/emmet-vim'
    -- https://github.com/lewis6991/gitsigns.nvim
    use 'lewis6991/gitsigns.nvim'
    -- https://github.com/L3MON4D3/LuaSnip
    use({
        "L3MON4D3/LuaSnip",
        requires = {
            -- https://github.com/rafamadriz/friendly-snippets [For LuaSnip]
            'rafamadriz/friendly-snippets'
        },
        -- follow latest release.
        -- tag = "v2.2", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
end)

