local nvim_lsp = require('lsp.nvim-lsp')

require('lspconfig').gopls.setup {
    cmd = {'gopls', '-remote=auto'},
    on_attach = nvim_lsp.on_attach,
    capabilities = nvim_lsp.capabilities(),
}
