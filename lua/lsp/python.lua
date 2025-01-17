local cap = require('lsp.capabilities')

require('lspconfig').pylsp.setup {
    capabilities = cap.capabilities(),
}
