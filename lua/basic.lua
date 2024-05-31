vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.autoread = true
vim.bo.autoread = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.shiftround = true
vim.bo.shiftround = true
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.bo.smartindent = true

vim.o.ignorecase = true
vim.bo.ignorecase = true
vim.o.smartcase = true
vim.bo.smartcase = true
vim.o.hlsearch = true
vim.bo.hlsearch = true
vim.o.incsearch = true
vim.bo.incsearch = true

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


-- last edit position
vim.cmd([[
  augroup basic
    autocmd!
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  augroup end
]])
