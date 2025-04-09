-- diagnostic
return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        focus = true,
        modes = {
            lsp_document_symbols = {
                auto_open = true,
                win = {
                    position = "right"
                },
            },
        }
    },
}
