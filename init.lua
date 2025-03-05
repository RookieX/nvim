-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")
require("basic")
require("lsp")
require("keys")
require("cs")
