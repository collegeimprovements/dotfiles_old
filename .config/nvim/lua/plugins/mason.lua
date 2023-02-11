return {
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
					},
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"sumneko_lua",
					"elixirls",
					"html",
					"cssls",
					"efm",
					"tailwindcss",
					"tsserver",
					"graphql",
				},
			})
		end,
	},
}
