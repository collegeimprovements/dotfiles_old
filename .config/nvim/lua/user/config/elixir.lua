local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.efm.setup({
	capabilities = capabilities,
	--	on_attach = on_attach,
	filetypes = { "elixir" },
})
