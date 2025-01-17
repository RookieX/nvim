local cap = require('lsp.capabilities')

require('lspconfig').lua_ls.setup {
    capabilities = cap.capabilities(),
}
