require('lspconfig').efm.setup {
    init_options = {documentFormatting = true},
    settings = {
        languages = {
            python = {
                {formatCommand = "black --quiet -", formatStdin = true}
            }
        }
    }
}
