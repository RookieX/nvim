local plugins = {
    { 'neovim/nvim-lspconfig' },   -- Configurations for Nvim LSP
    { "williamboman/mason.nvim" }, -- lsp installer
    { 'airblade/vim-gitgutter' },  -- git

    -- completions
    -- {'neoclide/coc.nvim', branch = 'release'}
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/nvim-cmp' },
    {
        'hrsh7th/cmp-vsnip',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
        }
    },
    { 'hrsh7th/vim-vsnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp"
    },
    { 'rafamadriz/friendly-snippets' },
    { 'onsails/lspkind-nvim' },
    {
        "chrisgrieser/nvim-scissors",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    },
    -- completions

    -- signature
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
    },

    { 'j-hui/fidget.nvim' }, -- Standalone UI for nvim-lsp progress

    -- explore
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        }
    },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- color schema
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },

    -- auto pairs
    {
        "windwp/nvim-autopairs",
    },

    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
    },

    -- status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- tab line
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- cursor
    {
        'RRethy/vim-illuminate'
    },

    -- diagnostic
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    -- rename
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    },

    -- terminal
    { 'akinsho/toggleterm.nvim' },

    -- breadcrumbs
    {
        'Bekaboo/dropbar.nvim',
        -- optional, but required for fuzzy finder support
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim'
        }
    }
}

require('lazy').setup(plugins, {})
