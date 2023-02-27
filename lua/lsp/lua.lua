local nvim_lsp = require('lsp.nvim-lsp')

require('lspconfig').lua_ls.setup {
    capabilities = nvim_lsp.capabilities(),
}
