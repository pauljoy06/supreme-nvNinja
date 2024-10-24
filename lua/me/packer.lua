-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-tree/nvim-web-devicons'},
            {'BurntSushi/ripgrep'}
        },
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
    use 'mbbill/undotree'

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
    -- https://github.com/tpope/vim-dadbod
    use({
        'tpope/vim-dadbod',
        requires = {
            -- https://github.com/kristijanhusak/vim-dadbod-ui
            'kristijanhusak/vim-dadbod-ui',
            -- https://github.com/kristijanhusak/vim-dadbod-completion
            'kristijanhusak/vim-dadbod-completion'
        },
    })

    -- https://github.com/L3MON4D3/LuaSnip
    use({
        "L3MON4D3/LuaSnip",
        requires = {
            -- https://github.com/rafamadriz/friendly-snippets [For LuaSnip]
            'rafamadriz/friendly-snippets',
            'hrsh7th/nvim-cmp'
        },
        -- follow latest release.
        -- tag = "v2.2", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    use {
      'hrsh7th/nvim-cmp',
      config = function ()
        require'cmp'.setup {
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },

        sources = {
          { name = 'luasnip' },
          -- more sources
        },
      }
      end
    }
    use { 'saadparwaiz1/cmp_luasnip' }
end)

