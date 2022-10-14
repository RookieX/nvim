local nvim_lsp = require('lsp.nvim-lsp')

require('lspconfig').sumneko_lua.setup {
    on_attach = nvim_lsp.on_attach,
    capabilities = nvim_lsp.capabilities(),
}
