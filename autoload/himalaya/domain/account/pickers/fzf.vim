" Represents the account picker based on [fzf] and [fzf.vim]. Both need
" to be installed in order to use this picker.
"
" [fzf]: https://github.com/junegunn/fzf
" [fzf.vim]: https://github.com/junegunn/fzf.vim
function! himalaya#domain#account#pickers#fzf#select(callback, accounts) abort
  call fzf#run({
  \ 'source': map(a:accounts, 'v:val.name'),
  \ 'sink': function(a:callback),
  \ 'down': '25%',
  \})
endfunction
