-- tab line
return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            mode = "buffers",
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
                    separator = false
                }
            }
        }
    }
}
