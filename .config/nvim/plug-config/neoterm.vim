" NeoTerm
" set nocompatible
" filetype off
" let &runtimepath.=',~/.vim/bundle/neoterm'
" silent! helptags ALL

let g:neoterm_autoscroll = '1'
let g:neoterm_size = 16
let g:neoterm_default_mode = 'vertical'
let g:neoterm_position = 'horizontal'

nnoremap <leader>tt :Ttoggle<CR>
nnoremap <leader>tt :Ttoggle<CR>
nnoremap <leader>tl :TREPLSendLine<CR>
nnoremap <c-l> :TREPLSendLine<CR>
nnoremap <leader>ts :TREPLSendSelection<CR>


" Use gx{text-object} in normal mode
nmap gx <Plug>(neoterm-repl-send)

" Send selected contents in visual mode.
xmap gx <Plug>(neoterm-repl-send)

" Send lines to Neoterm repl
nmap gxx <Plug>(neoterm-repl-send-line)
