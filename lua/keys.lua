local set = vim.keymap.set
local opt = { noremap = true, silent = true }

set("n", "<F1>", ":NvimTreeToggle<CR>", opt)
set("n", "<F3>", ":NvimTreeFindFile<CR>", opt)

set('n', '<C-T>', ":Telescope find_files<CR>", opt)
