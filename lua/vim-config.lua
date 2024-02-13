-- General
vim.g.mapleader = " "
vim.cmd("set number relativenumber")

-- Cursor
vim.cmd("set cursorline")

-- Use ctrl-<arrows> to select the active split
vim.cmd("nmap <silent> <c-Up> :wincmd k<CR>")
vim.cmd("nmap <silent> <c-Down> :wincmd j<CR>")
vim.cmd("nmap <silent> <c-Left> :wincmd h<CR>")
vim.cmd("nmap <silent> <c-Right> :wincmd l<CR>")

-- Tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Spell check
vim.cmd("nmap <leader>of :setlocal spell! spelllang=fr<CR>")
vim.cmd("nmap <leader>oe :setlocal spell! spelllang=en<CR>")
vim.cmd(":setlocal spell! spelllang=en")
