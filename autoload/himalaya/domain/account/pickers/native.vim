" Represents the account picker based the standard vim function
" input. See `help input`.
function! himalaya#domain#account#pickers#native#select(callback, accounts) abort
  let accounts = map(copy(a:accounts), 'printf("%s (%d)", v:val.name, v:key)')
  
  let account_index = input(join(accounts, ', ') . ': ')
  if account_index == ''
    throw 'Action aborted!'
  endif
  
  redraw | echo
  call function(a:callback)(a:accounts[account_index].name)
endfunction
