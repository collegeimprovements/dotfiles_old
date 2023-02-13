return {
	{
		"phaazon/hop.nvim",
		event = "BufReadPost",

		config = function()
			require("hop").setup()
		end,
	},
}
