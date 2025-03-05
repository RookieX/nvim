-- color schema
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        local colors = require("catppuccin.palettes").get_palette()
        require("catppuccin").setup({
            dim_inactive = {
                enabled = true,
                shade = "light",
                percentage = 0.9,
            },
            styles = {
                comments = { "italic", "bold" },
            },
            integrations = {
                cmp = true,
                gitsigns = false,
                nvimtree = true,
                telescope = true,
                treesitter = true,
                dap = {
                    enabled = true,
                    enable_ui = true, -- enable nvim-dap-ui
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },

            custom_highlights = {
                LineNr = { fg = "#99ff66" },
                Comment = { fg = "#7d7d7d" },
                TSConstBuiltin = { fg = colors.peach, style = {} },
                TSConstant = { fg = colors.sky },
                TSComment = { fg = colors.surface2, style = { "italic" } }
            },
        })

    end
}
