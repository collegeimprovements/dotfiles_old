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
]],
	false
)

-- Format on save and heex
-- This is a hack where we set heex as html first and then as eelixir to make sure all LSPs are available.
vim.api.nvim_command("autocmd BufNew,BufNewFile,BufRead *.heex set ft=html")
vim.api.nvim_command("autocmd BufNew,BufNewFile,BufRead *.heex set ft=eelixir")

vim.api.nvim_command("autocmd BufWritePre *.lua lua vim.lsp.buf.format({ async = true })")
vim.api.nvim_command("autocmd BufWritePre *.ex,*.exs,*.eex,*.heex lua vim.lsp.buf.format({ async = true })")
