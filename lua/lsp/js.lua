vim.lsp.enable('ts_ls')

vim.lsp.config('ts_ls', {
    on_attach = on_attach,
    capabilities = require("lsp.capabilities").capabilities(),
}
)
