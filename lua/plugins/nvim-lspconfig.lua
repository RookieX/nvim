-- Configurations for Nvim LSP
return {
    'neovim/nvim-lspconfig',
    config = function()
        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'gl', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                -- vim.keymap.set('n', 'gn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', 'gn', ":IncRename ", bufopts)
                vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'ƒ', function() vim.lsp.buf.format { async = false } end, bufopts) -- option + F
                vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = false } end, bufopts)
                -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                -- vim.keymap.set('n', '<space>wl', function()
                --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, bufopts)
            end,
        })
    end
}
