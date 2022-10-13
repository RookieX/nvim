local l = require('lsp.nvim-lsp')
require('lspconfig').sumneko_lua.setup{
    on_attach = l.on_attach,
}
