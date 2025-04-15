-- diagnostic
return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        focus = true,
        auto_refresh = false,
        modes = {
            lsp_document_symbols = {
                win = {
                    position = "right"
                },
            },
        }
    },
}
