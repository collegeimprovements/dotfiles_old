return {
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			"ahmedkhalf/project.nvim",
		},
		config = function()
			require("nvim-tree").setup({
				update_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					-- enables the feature
					enable = true,
					-- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
					-- only relevant when `update_focused_file.enable` is true
					update_cwd = true,
					-- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
					-- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
					ignore_list = {},
				},
			})
		end,
	},
}
