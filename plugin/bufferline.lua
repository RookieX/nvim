require("bufferline").setup {
    options = {
        numbers = "ordinal",
        indicator = {
            style = 'underline',
        },
        diagnostics = "nvim_lsp",
        color_icons = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true
            }
        },
    }
}
