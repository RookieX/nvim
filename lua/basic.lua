vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.wrap = false

vim.o.autoread = true
vim.bo.autoread = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.bo.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

vim.opt.termguicolors = true
vim.o.showmode = false

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.mouse = 'c'

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 99

vim.o.signcolumn = "auto:3"

vim.g.colorscheme = "github_*"

vim.g.python3_host_prog = "~/.virtualenvs/p3/bin/python"

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- last edit position
vim.cmd([[
  augroup basic
    autocmd!
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  augroup end
]])
