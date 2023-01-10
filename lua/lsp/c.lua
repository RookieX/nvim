local nvim_lsp = require('lsp.nvim-lsp')

require('lspconfig').clangd.setup {
    capabilities = nvim_lsp.capabilities(),
}
