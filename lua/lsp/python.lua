local l = require('lsp.nvim-lsp')
require('lspconfig').pyright.setup{
    on_attach = l.on_attach,
    settings = {
        formatCommand = {"black"}
    }
}
