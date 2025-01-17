local cap = require('lsp.capabilities')

require('lspconfig').clangd.setup {
    capabilities = cap.capabilities(),
}
