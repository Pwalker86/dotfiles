return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		--load colorscheme here
		vim.cmd.colorscheme("tokyonight")
		-- vim.cmd([[colorscheme tokyonight]])
	end,
}
