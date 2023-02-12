return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-autopairs",
			"David-Kunz/markid",
			"andymass/vim-matchup",
		},
		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"elixir",
					"eex",
					"erlang",
					"heex",
					"surface",
					"html",
					"graphql",
					"lua",
					"sql",
					"bash",
					"javascript",
					"typescript",
					"css",
					"json",
					"yaml",
					"comment",
				},
				sync_install = true,
				ignore_install = { "" }, -- List of parsers to ignore installing
				highlight = {
					enable = true, -- false will disable the whole extension
					disable = { "c" }, -- list of language that will be disabled
					use_languagetree = true,
					additional_vim_regex_highlighting = true,
				},
				indent = { enable = true, disable = { "yaml" } },
				rainbow = {
					enable = true,
					-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = nil, -- Do not enable for files with more than n lines, int
					-- colors = {}, -- table of hex strings
					-- termcolors = {} -- table of colour name strings
				},
				--  Custom Plugins
				endwise = {
					enable = true,
				},
				autopairs = {
					enable = true,
				},
				autotag = {
					enable = true,
					enable_rename = true,
					filetypes = {
						"html",
						"heex",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"tsx",
						"jsx",
						"css",
						"lua",
						"xml",
						"markdown",
					},
				},
				matchup = {
					enable = true, -- mandatory, false will disable the whole extension
					disable = { "c", "ruby" }, -- optional, list of language that will be disabled
				},
				markid = { enable = true },
			})
		end,
	},
}
