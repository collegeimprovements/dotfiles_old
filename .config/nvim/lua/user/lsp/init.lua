local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
require("user.lsp.lsp-signature")

-- Format on save and heex
-- This is a hack where we set heex as html first and then as eelixir to make sure all LSPs are available.
vim.api.nvim_command("autocmd BufNew,BufNewFile,BufRead *.heex set ft=html")
vim.api.nvim_command("autocmd BufNew,BufNewFile,BufRead *.heex set ft=eelixir")

vim.api.nvim_command("autocmd BufWritePre *.lua lua vim.lsp.buf.format({ async = true })")
vim.api.nvim_command("autocmd BufWritePre *.ex,*.exs,*.eex,*.heex lua vim.lsp.buf.format({ async = true })")

-- When multiple LSPs are involved (e.g. elixirls & efm) then to avoid choosing which one to use, always use `formatting_seq_sync` instead of `formatting_sync`
-- vim.api.nvim_command("autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_seq_sync(nil, 2000)")
-- vim.api.nvim_command("autocmd BufWritePre *.ex,*.exs lua vim.lsp.buf.formatting_seq_sync(nil, 2000)")
