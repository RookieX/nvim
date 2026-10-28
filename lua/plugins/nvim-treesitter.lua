return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').setup()
        local group = vim.api.nvim_create_augroup('treesitter_features', { clear = true })
        vim.api.nvim_create_autocmd('FileType', {
            group = group,
            callback = function(args)
                if not pcall(vim.treesitter.start, args.buf) then
                    return
                end
                local ft = vim.bo[args.buf].filetype
                if not vim.tbl_contains({ 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }, ft) then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
        -- Sessions saved with the master branch may restore its removed function.
        vim.api.nvim_create_autocmd('OptionSet', {
            group = group,
            pattern = 'indentexpr',
            callback = function()
                if vim.bo.indentexpr == 'nvim_treesitter#indent()' then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
