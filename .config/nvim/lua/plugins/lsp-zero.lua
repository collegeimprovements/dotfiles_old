return {
	{
		"VonHeikemen/lsp-zero.nvim",
		event = "BufReadPre",

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

			lsp.setup_nvim_cmp({
				mapping = lsp.defaults.cmp_mappings,
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp", keyword_length = 1 },
					{ name = "buffer", keyword_length = 3 },
					{ name = "luasnip", keyword_length = 2 },
				},
			})

			lsp.ensure_installed({
				"lua_ls",
				"emmet_ls",
				"bashls",
				"elixirls",
				"efm",
				"tsserver",
				"eslint",
				"tailwindcss",
				"html",
				"cssls",
				"graphql",
				"jsonls",
			})

			-- Fix Undefined global 'vim'
			lsp.configure("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })

			lsp.setup()
		end,
	},
}
