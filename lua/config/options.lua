-- vim.g.lazyvim_ruby_lsp = "ruby_lsp"
-- vim.g.lazyvim_ruby_formatter = "rubocop"

vim.opt.wrap = true
-- clipboard
vim.opt.clipboard:append("unnamedplus")
--
-- set tab to insert 2 spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Split settings
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Disable Copilot completions
-- vim.g.copilot_enabled = false
