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