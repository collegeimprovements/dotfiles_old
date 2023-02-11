return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local diagnostics = null_ls.builtins.diagnostics
			local formatting = null_ls.builtins.formatting

			null_ls.setup({
				debug = false,
				sources = {
					-- formatting.black.with({ extra_args = { "--fast" } }),
					formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
					-- formatting.beautysh,
					formatting.stylua,
					formatting.mix,
					formatting.jq,
					formatting.pg_format,
					-- formatting
					diagnostics.credo,
					diagnostics.eslint,
					diagnostics.hadolint,
					-- diagnostics.luacheck,
				},
			})
		end,
	},
}
