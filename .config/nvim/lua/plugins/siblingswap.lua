return {
	"Wansmer/sibling-swap.nvim",
	requires = { "nvim-treesitter" },
	config = function()
		require("sibling-swap").setup({})
	end,
}
