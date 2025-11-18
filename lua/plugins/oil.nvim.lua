return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        default_file_explorer = false,
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
        delete_to_trash = true,
        watch_for_changes = true,
        keymaps = {
            ["<C-v>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-r>"] = "actions.refresh",
        }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
