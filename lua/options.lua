
vim.opt.clipboard = 'unnamedplus' -- sys clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'

-- Tabs
vim.opt.tabstop = 4 -- number of visual spaces per TAB 
vim.opt.softtabstop = 4 -- numbe of visual spaces when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on tab
vim.opt.expandtab = true -- tabs are spaces


-- UI
vim.opt.number = true -- absolute number
vim.opt.relativenumber = true -- add numbers to each line on left side
vim.opt.cursorline = true -- highlight cursor line
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal split right 
vim.opt.termguicolors = true -- 24-bit RGB in the TUI


-- Searching
vim.opt.incsearch = true -- search as chars are entered
vim.opt.hlsearch = false -- do not do hightlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- case sensitive if an uppercase if entered
