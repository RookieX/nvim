vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
local colors = require("catppuccin.palettes").get_palette()
require("catppuccin").setup({
    term_colors = true,
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
        gitsigns = true,
        nvimtree = false,
        telescope = true,
        treesitter = true,
        gitgutter = true,
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
        Comment = { fg = "#7d7d7d" },
        TSConstBuiltin = { fg = colors.peach, style = {} },
        TSConstant = { fg = colors.sky },
        TSComment = { fg = colors.surface2, style = { "italic" } }
    },
})
vim.api.nvim_command "colorscheme catppuccin"
