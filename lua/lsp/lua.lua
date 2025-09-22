vim.lsp.enable('lua_ls')

vim.lsp.config('lua_ls', {
    capabilities = require("lsp.capabilities").capabilities(),
}
)
