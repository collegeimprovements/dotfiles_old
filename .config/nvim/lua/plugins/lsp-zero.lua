return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			{ "lukas-reineke/lsp-format.nvim", config = true },
		},
		config = function()
			local lsp = require("lsp-zero")
			lsp.preset("recommended")

			-- Fix Undefined global 'vim'
			lsp.configure("sumneko_lua", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
			lsp.setup()
		end,
	},
}
