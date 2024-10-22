-- NOTE: this requires the `nvim-lspconfig` as additional dependency
require('lspconfig').basics_ls.setup({
    settings = {
        snippet = {
            enable = true,
        },
    }
})
