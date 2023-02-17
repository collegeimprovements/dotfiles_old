return {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup({
      enable = true,
      filetypes = { "html", "xml", "eex", "heex", "eelixir" },
    })
  end,
}
