local nvim_lsp = require('lsp.nvim-lsp')

require('lspconfig').sumneko_lua.setup {
    capabilities = nvim_lsp.capabilities(),
}
