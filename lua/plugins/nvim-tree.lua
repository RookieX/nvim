-- explore
return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    opts = {
        disable_netrw = true,
        open_on_tab = true,
        hijack_cursor = true,

        diagnostics = {
            enable = true,
            show_on_dirs = true,
        },

        view = {
            number = true,
            relativenumber = true,
        },

        renderer = {
            highlight_git = true,
            icons = {
                show = {
                    git = true,
                }
            }
        },

        filters = {
            dotfiles = true,
        },

        live_filter = {
            prefix = ':',
        }
    }
}
