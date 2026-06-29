
-- Disable unused providers to avoid slow startup
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

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
-- vim.g.transparent_enabled = true -- global var


-- Searching
vim.opt.incsearch = true -- search as chars are entered
vim.opt.hlsearch = false -- do not do hightlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- case sensitive if an uppercase if entered

-- Markdown
vim.g.markdown_fenced_languages = { "cpp", "c", "rust", "python" }
