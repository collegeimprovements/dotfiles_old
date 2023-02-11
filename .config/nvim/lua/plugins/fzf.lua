return {
  -- { 'junegunn/fzf', build = ":call fzf#install()"},
  -- { 'junegunn/fzf.vim'},
    {
        "junegunn/fzf.vim",
        dependencies = {
            "junegunn/fzf",  build = ":call fzf#install()"
        },
        config = function()
          vim.env.FZF_DEFAULT_OPTS = "--layout=reverse"
        end
    }
}