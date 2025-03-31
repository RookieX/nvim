local cap = require('lsp.capabilities')

require('lspconfig').pyright.setup {
    capabilities = cap.capabilities(),
}
