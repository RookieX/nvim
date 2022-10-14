local nvim_lsp = require('lsp.nvim-lsp')

require('lspconfig').pyright.setup {
    capabilities = nvim_lsp.capabilities(),
}
