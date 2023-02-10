local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    -- formatting.black.with({ extra_args = { "--fast" } }),
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.beautysh,
    formatting.stylua,
    formatting.mix,
    formatting.jq,
    formatting.pg_format,
    -- formatting
    diagnostics.credo,
    diagnostics.eslint,
    diagnostics.hadolint,
    -- diagnostics.luacheck,
  },
})
