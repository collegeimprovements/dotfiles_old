require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    "rktjmp/lush.nvim";
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";

    "kyazdani42/nvim-web-devicons";
    "glepnir/galaxyline.nvim";
    "famiu/feline.nvim";
    "kyazdani42/nvim-tree.lua";

    "neovim/nvim-lspconfig";          -- Mind the semi-colons
    "nvim-treesitter/nvim-treesitter";
    "glepnir/lspsaga.nvim";
    "ray-x/lsp_signature.nvim";

    "hrsh7th/nvim-compe";
    "hrsh7th/vim-vsnip";
    "lewis6991/gitsigns.nvim";
    "lukas-reineke/indent-blankline.nvim";
    "b3nj5m1n/kommentary";
    "stevearc/qf_helper.nvim";
    "phaazon/hop.nvim";
    "windwp/nvim-autopairs";
    "p00f/nvim-ts-rainbow";
    "npxbr/gruvbox.nvim";
    "akinsho/nvim-toggleterm.lua";
    "elixir-editors/vim-elixir";
    "nvim-telescope/telescope.nvim";
    "ahmedkhalf/lsp-rooter.nvim";
    "pechorin/any-jump.vim";
    "kassio/neoterm"; 
    "kabouzeid/nvim-lspinstall";
    "tjdevries/nlua.nvim";
}


local o = vim.o
local wo = vim.wo
local bo = vim.bo

vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_char1()<cr>", {})

CONFIG_PATH = vim.fn.stdpath("config")
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
TERMINAL = vim.fn.expand("$TERMINAL")
USER = vim.fn.expand("$USER")

-- require('feline').setup({})
vim.cmd('source ' .. '~/.config/nvim/lua/config.vim')

require('nvim-autopairs').setup()
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

require("lsp-rooter").setup {}
require("toggleterm").setup{  shell = 'zsh' }

require('gitsigns').setup()

local lspconfig = require("lspconfig")

-- Neovim doesn't support snippets out of the box, so we need to mutate the
-- capabilities we send to the language server to let them know we want snippets.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup our autocompletion. These configuration options are the default ones
-- copied out of the documentation.
require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "disabled",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    tags = true,
    treesitter = true
  }
}

local LSP = require("lsp")

local path_to_elixirls = vim.fn.expand("~/elixir-ls/rel/language_server.sh")
LSP.setup(
  "elixirls",
  {
    settings = {
      elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false
      }
    },
    cmd = {path_to_elixirls},
    on_attach = function(client, bufnr)
      require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach
    end
  }
)
LSP.setup(
  "efm",
  {
    filetypes = {
      "elixir",
      "javascript",
      "lua",
      "bash",
      "zsh",
      "sh"
    }
  }
)

local saga = require 'lspsaga'
saga.init_lsp_saga()


require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
require'lspinstall'.setup() -- important

