" Represents the account picker based on [fzf-lua]. The plugin
" needs to be installed in order to use this picker. Only works on
" Neovim.
"
" [fzf-lua]: https://github.com/ibhagwan/fzf-lua
function! himalaya#domain#account#pickers#fzflua#select(callback, accounts) abort
  call luaeval('require("himalaya.account.pickers.fzflua").select')(a:callback, a:accounts)
endfunction
