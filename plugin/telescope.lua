local actions = require('telescope.actions')

require('telescope').setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        -- ..
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        },
        dynamic_preview_title = true,
    },
    pickers = {
        find_files = {
            theme = "ivy",
        },
        live_grep = {
            theme = "ivy",
        }
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
})
