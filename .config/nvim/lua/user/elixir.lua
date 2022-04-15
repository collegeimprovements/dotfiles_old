-- local elixir = require("elixir")
-- elixir.setup()

-- `on_attach` callback will be called after a language server
-- instance has been attached to an open buffer with matching filetype
-- here we"re setting key mappings for hover documentation, goto definitions, goto references, etc
-- you may set those key mappings based on your own preference
local lsp_signature = require("lsp_signature")

local on_attach = function(client, bufnr)
  lsp_signature.on_attach()

  local opts = { noremap = true, silent = true }

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "df", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  vim.keymap.set("n", "gr", ":References<cr>", opts)
  vim.keymap.set("n", "g0", ":DocumentSymbols<cr>", opts)
  vim.keymap.set("n", "gW", ":WorkspaceSymbols<cr>", opts)
  vim.keymap.set("n", "<leader>d", ":Diagnostics<cr>", opts)
end

-- nvim-cmp
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- setting up the elixir language server
-- you have to manually specify the entrypoint cmd for elixir-ls
local path_to_elixirls = vim.fn.expand("~/language-servers/elixir-ls/release/language_server.sh")

local lspconfig = require("lspconfig")

lspconfig.elixirls.setup({
  require("lsp_signature").on_attach(),
  cmd = { path_to_elixirls },
  on_attach = on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
    },
  },
})

lspconfig.efm.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "elixir" },
})

--------------------------------------------------------------------------------------
-- Elixir Pipes:
-- Adds |> when we press <C-l>,
-- Adds |> IO.inspect(label: "here") when we press <C-h>
vim.api.nvim_exec(
  [[
augroup elixirbindings
  autocmd! elixirbindings
  autocmd Filetype elixir imap <buffer> <silent> <C-l> \|>
  autocmd Filetype elixir imap <buffer> <silent> <C-h> \|> IO.inspect(label: "Here")
  " autocmd Filetype elixir imap <buffer> <silent> <C-m> %{}
augroup end
]] ,
  false
)
--------------------------------------------------------------------------------------
