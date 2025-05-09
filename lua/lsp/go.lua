lspconfig = require "lspconfig"
util = require "lspconfig/util"

lspconfig.gopls.setup {
    cmd = { 'gopls', '-remote=auto' },
    capabilities = require("lsp.capabilities").capabilities(),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
        end
    end
end

vim.cmd([[
  augroup gopls
    autocmd!
    autocmd BufWritePre *.go lua go_org_imports(100)
  augroup end
]])

-- autocmd BufWritePre *.go lua vim.lsp.buf.format({ sync = false })
