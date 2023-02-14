-- colorscheme
return {
  {
    "junegunn/seoul256.vim",
    event = "VeryLazy",

    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.g.one_allow_italics = true
      vim.g.seoul256_background = 234
      -- load the colorscheme here
      vim.cmd([[colorscheme seoul256]])
    end,
  },
}
