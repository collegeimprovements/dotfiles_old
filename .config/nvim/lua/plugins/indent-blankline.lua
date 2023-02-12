return {
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
				show_current_context_start = true,
				show_end_of_line = true,
			})

			vim.g.indentLine_char = "│"
			vim.g.indent_blankline_char = "│"
			-- vim.g.indentLine_faster = 1
			-- vim.g.indentLine_setConceal = 2
			-- vim.g.indentLine_concealcursor = ""
			-- vim.g.indentLine_bufNameExclude = {"term:.*"}
		end,
	},
}
