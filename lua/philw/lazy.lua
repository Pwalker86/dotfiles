-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "philw.plugins" },
	{ import = "philw.plugins.lsp" },
	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	-- { import = "lazyvim.plugins.extras.lang.ruby" },
}, {
	install = {
		colorscheme = { "tokyonight" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

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

-- Key mappings
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })

vim.api.nvim_set_keymap("i", "fj", "<esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "jf", "<esc>", { noremap = true })

vim.api.nvim_set_keymap("n", ":Q", ":q", { noremap = true })
vim.api.nvim_set_keymap("n", ":W", ":w", { noremap = true })

-- Disable Copilot completions
vim.g.copilot_enabled = false
