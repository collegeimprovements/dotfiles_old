return {
    {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      -- Helpers to install LSPs and maintain them
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    }
  }
}