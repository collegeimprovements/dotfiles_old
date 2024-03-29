return {
	{
		"nat-418/boole.nvim",
		event = "BufReadPre",

		config = function()
			require("boole").setup({
				mappings = {
					increment = "<C-a>",
					decrement = "<C-x>",
				},
				-- User defined loops
				additions = {
					{ "flex", "hidden" },
					{ "tic", "tac", "toe" },
					{ "<%= %>", "<% %>", "toe" },
				},
				allow_caps_additions = {
					{ "enable", "disable" },
					-- enable → disable
					-- Enable → Disable
					-- ENABLE → DISABLE
				},
			})
		end,
	},
}
