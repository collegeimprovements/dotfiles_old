local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local ok, lazy = pcall(require, "lazy")
if not ok then
  return
end

require("lazy").setup({
  {
    "junegunn/fzf",
    run = function()
      vim.fn["fzf#install"]()
    end,
  },
  "nvim-treesitter/nvim-treesitter",
  "williamboman/mason.nvim",
  "RRethy/nvim-treesitter-endwise",
  "dstein64/vim-startuptime",
  "alvan/vim-closetag",
  "nathom/filetype.nvim",
  "andymass/vim-matchup",
  "AndrewRadev/tagalong.vim",
  "lewis6991/impatient.nvim",
  "tjdevries/nlua.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "kylechui/nvim-surround",
  "nat-418/boole.nvim",
  "wsdjeg/vim-fetch",
  "machakann/vim-sandwich",
  "mg979/vim-visual-multi",
  "numToStr/Comment.nvim",
  "kassio/neoterm",
  "tpope/vim-repeat",
  "weilbith/nvim-code-action-menu",
  "windwp/nvim-autopairs",
  "pechorin/any-jump.vim",
  "phaazon/hop.nvim",
  "ray-x/guihua.lua",
  "ray-x/sad.nvim",
  "elixir-editors/vim-elixir",
  "kyazdani42/nvim-web-devicons",
  "junegunn/seoul256.vim",
  "David-Kunz/markid",

  "ahmedkhalf/project.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "tpope/vim-dispatch",
  "folke/trouble.nvim",
  "folke/lsp-colors.nvim",
  "ojroques/nvim-hardline",
  "kyazdani42/nvim-tree.lua",

  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "tamago324/nlsp-settings.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "rmagatti/goto-preview",
  "antoinemadec/FixCursorHold.nvim",
  "onsails/lspkind-nvim",
  "ray-x/lsp_signature.nvim",
  "vim-test/vim-test",

  "simrat39/symbols-outline.nvim",
  "ruifm/gitlinker.nvim",
  "kdheepak/lazygit.nvim",
  "lewis6991/gitsigns.nvim",

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
