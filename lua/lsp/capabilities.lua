local C = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

function C.capabilities()
    return capabilities
end

return C
