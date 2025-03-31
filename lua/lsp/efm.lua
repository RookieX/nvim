require('lspconfig').efm.setup {
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true
    },
    settings = {
        languages = {
            lua = {
                { formatCommand = "lua-format -i", formatStdin = true }
            },
            python = {
                { formatCommand = "black --quiet -", formatStdin = true }
            }
        }
    },
    single_file_support = true
}
