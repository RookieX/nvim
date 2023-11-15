-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use "williamboman/mason.nvim" -- lsp installer
    use 'airblade/vim-gitgutter' -- git

    -- completions
    -- use {'neoclide/coc.nvim', branch = 'release'}
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/nvim-cmp'
    use {
        'hrsh7th/cmp-vsnip',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
        }
    }
    use 'hrsh7th/vim-vsnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'onsails/lspkind-nvim'
    -- completions

    use 'j-hui/fidget.nvim' -- Standalone UI for nvim-lsp progress

    -- explore
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- color schema
    use {
        "catppuccin/nvim",
        as = "catppuccin",
    }

    -- auto pairs
    use {
        "windwp/nvim-autopairs",
    }

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
    }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- tab line
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- cursor
    use {
        'RRethy/vim-illuminate'
    }

    -- diagnostic
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }

    use {
        "github/copilot.vim"
    }

    use({
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        }
    })
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
