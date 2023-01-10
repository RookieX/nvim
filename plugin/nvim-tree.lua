require("nvim-tree").setup({
    disable_netrw = true,
    ignore_buffer_on_setup = true,
    open_on_setup = false,
    open_on_setup_file = false,
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
})
