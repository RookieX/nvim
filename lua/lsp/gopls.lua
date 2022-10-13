local l = require('lsp.nvim-lsp')
require('lspconfig').gopls.setup{
    on_attach = l.on_attach,
}
