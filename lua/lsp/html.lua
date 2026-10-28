vim.lsp.config("html", {
    capabilities = require("lsp.capabilities").capabilities(),
    -- Use Prettier for formatting, and HTML LSP for language features.
    init_options = {
        provideFormatter = false,
    },
})
vim.lsp.enable("html")

vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "InsertEnter" }, {
    group = vim.api.nvim_create_augroup("html_indent", { clear = true }),
    callback = function(args)
        if vim.bo[args.buf].filetype ~= "html" then
            return
        end
        -- Keep HTML indentation stable after ftplugins and Treesitter attach.
        if vim.fn.exists("*HtmlIndent") == 1 then
            vim.bo[args.buf].indentexpr = "HtmlIndent()"
        end
        vim.bo[args.buf].expandtab = true
        vim.bo[args.buf].tabstop = 2
        vim.bo[args.buf].softtabstop = 2
        vim.bo[args.buf].shiftwidth = 2
        vim.bo[args.buf].autoindent = true
        vim.bo[args.buf].smartindent = false
    end,
})
