" Represents the account picker based on [telescope.nvim]. The plugin
" needs to be installed in order to use this picker. Only works on
" Neovim.
"
" [telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
function! himalaya#domain#account#pickers#telescope#select(callback, accounts) abort
  call luaeval('require("himalaya.account.pickers.telescope").select')(a:callback, a:accounts)
endfunction
