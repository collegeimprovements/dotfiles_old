-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PaqSync
  augroup end
]])

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

require("paq")({
	"savq/paq-nvim",
	-- Let Paq manage itself
	-- libs
	"tjdevries/nlua.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"rktjmp/lush.nvim",
	"tjdevries/colorbuddy.vim",
	-- tools
	"mg979/vim-visual-multi",
	"numToStr/Comment.nvim",
	"kassio/neoterm",
	"tpope/vim-repeat",
	-- "nvim-lualine/lualine.nvim",
	"weilbith/nvim-code-action-menu",
	-- "tpope/vim-projectionist",
	"nvim-treesitter/nvim-treesitter",
	"windwp/nvim-autopairs",
	"pechorin/any-jump.vim",
	"phaazon/hop.nvim",
	"junegunn/fzf.vim",
	{
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	},
	"ray-x/guihua.lua",
	"ray-x/sad.nvim",
	-- languages
	"elixir-editors/vim-elixir",
	"mhanberg/elixir.nvim",
	-- appearance
	"kyazdani42/nvim-web-devicons",
	-- "lifepillar/vim-gruvbox8",
	-- "sonph/onehalf",
	-- "chriskempson/base16-vim",
	-- "rakr/vim-one",
	-- "sainnhe/edge",
	"junegunn/seoul256.vim",
	-- "tjdevries/gruvbuddy.nvim",
	"ahmedkhalf/project.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"tpope/vim-dispatch",
	"folke/trouble.nvim",
	-- "folke/lsp-colors.nvim",
	"ojroques/nvim-hardline",
	"kyazdani42/nvim-tree.lua",
	-- lsp
	"neovim/nvim-lspconfig",
	"williamboman/nvim-lsp-installer",
	"tamago324/nlsp-settings.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"rmagatti/goto-preview",
	"antoinemadec/FixCursorHold.nvim",
	"onsails/lspkind-nvim",
	-- "nvim-telescope/telescope.nvim",
	"ray-x/lsp_signature.nvim",
	"vim-test/vim-test",

	"simrat39/symbols-outline.nvim",
	"ruifm/gitlinker.nvim",
	"tanvirtin/vgit.nvim",
	"kdheepak/lazygit.nvim",
	"lewis6991/gitsigns.nvim",
	-- "sindrets/diffview.nvim",

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-document-symbol",
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip",

	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
})
