local nvim_lsp = require('lsp.nvim-lsp')

require('lspconfig').pylsp.setup {
    capabilities = nvim_lsp.capabilities(),
}
