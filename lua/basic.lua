vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.autoread = true
vim.bo.autoread = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

vim.opt.termguicolors = true
vim.o.showmode = false

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.mouse = 'c'

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 99

vim.g.colorscheme = "github_*"

vim.g.python3_host_prog = "~/.virtualenvs/p3/bin/python"
