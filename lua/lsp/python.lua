vim.lsp.enable('pyright')

vim.lsp.config('pyright',{
    capabilities = require("lsp.capabilities").capabilities(),
}
)
