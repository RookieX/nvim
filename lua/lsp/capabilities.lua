local C = {}

function C.capabilities()
    return require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
end

return C
