" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'readonly', 'relativepath', 'modified', 'method' ] ]
"       \ },
"       \ 'component_function': {
"       \   'method': 'NearestMethodOrFunction'
"       \ },
"       \ 'component': {
"       \   'helloworld': 'Hello, world!'
"       \ },
"       \ }

let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame', 'branch' ]
  \   ],
  \ },
  \ 'component_function': {
  \     'blame': 'LightlineGitBlame',
  \     'branch': 'LightlineGitBranch'
  \   }
  \ }


function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction
" g:coc_git_status

function! LightlineGitBranch() abort
  let branch = get(g:, 'coc_git_status', '')
  " return blame
  return winwidth(0) > 120 ? branch : ''
endfunction
