return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"solargraph", -- Ruby LSP
				"ruby_lsp", -- Ruby LSP alternative
				"rubocop",
				"emmet_ls", -- HTML completion
				"html", -- HTML LSP
				"cssls", -- CSS LSP
				"tailwindcss", -- Tailwind LSP
			},
			automatic_installation = true,
		})
	end,
}
