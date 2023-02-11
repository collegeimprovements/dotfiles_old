local configs = require("nvim-treesitter.configs")
configs.setup({
  -- Add a language of your choice
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "eex",
    "elixir",
    "erlang",
    "graphql",
    "heex",
    "html",
    "javascript",
    "json",
    "lua",
    "ruby",
    "surface",
    "yaml",
  },
  sync_install = true,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "c" }, -- list of language that will be disabled
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  --  Custom Plugins
  endwise = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
    enable_rename = true,
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "css",
      "lua",
      "xml",
      "php",
      "markdown",
    },
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" }, -- optional, list of language that will be disabled
  },
})
