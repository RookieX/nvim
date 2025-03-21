-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("basic")
require("config.lazy")
require("lsp")
require("keys")
require("cs")
