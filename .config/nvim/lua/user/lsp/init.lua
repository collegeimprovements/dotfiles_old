local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

-- Format on save
-- When multiple LSPs are involved (e.g. elixirls & efm) then to avoid choosing which one to use, always use `formatting_seq_sync` instead of `formatting_sync`
vim.api.nvim_command("autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_seq_sync(nil, 2000)")
vim.api.nvim_command("autocmd BufWritePre *.ex,*.exs lua vim.lsp.buf.formatting_seq_sync(nil, 2000)")
