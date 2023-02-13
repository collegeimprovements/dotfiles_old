return {
	{
		"cshuaimin/ssr.nvim",
		event = "BufReadPost",
		keys = {
			{
				"<leader>sR",
				function()
					require("ssr").open()
				end,
				mode = { "n", "x" },
				desc = "Structural Replace",
			},
		},
		config = function()
			vim.keymap.set({ "n", "x" }, "<leader>sr", function()
				require("ssr").open()
			end)
		end,
	},
}
