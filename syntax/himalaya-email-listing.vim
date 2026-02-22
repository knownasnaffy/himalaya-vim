if exists('b:current_syntax')
  finish
endif

" Always highlight pipe separators, even inside column matches
syntax match HimalayaSeparator /|/ containedin=ALL

" Header row (line 1)
syntax match HimalayaHead /\%1l.*/ contains=HimalayaSeparator
highlight HimalayaHead term=bold cterm=bold gui=bold

" Table rule row (line 2)
syntax match HimalayaRule /\%2l.*/ contains=HimalayaSeparator
highlight default link HimalayaRule WinSeparator

" Derive column boundaries from header pipes
let s:header = getline(1)
let s:cols = []
let s:idx = 0

while 1
  let s:idx = match(s:header, '|', s:idx)
  if s:idx == -1
    break
  endif
  call add(s:cols, s:idx + 1)
  let s:idx += 1
endwhile

" Data rows start at line 3
let s:lstart = 3

if len(s:cols) >= 6

  execute 'syntax match HimalayaId /\%>' . (s:lstart - 1) . 'l'
        \ . '\%>' . s:cols[0] . 'c'
        \ . '[^|]*/'

  execute 'syntax match HimalayaFlags /\%>' . (s:lstart - 1) . 'l'
        \ . '\%>' . s:cols[1] . 'c'
        \ . '[^|]*/'

  execute 'syntax match HimalayaSubject /\%>' . (s:lstart - 1) . 'l'
        \ . '\%>' . s:cols[2] . 'c'
        \ . '[^|]*/'

  execute 'syntax match HimalayaSender /\%>' . (s:lstart - 1) . 'l'
        \ . '\%>' . s:cols[3] . 'c'
        \ . '[^|]*/'

  execute 'syntax match HimalayaDate /\%>' . (s:lstart - 1) . 'l'
        \ . '\%>' . s:cols[4] . 'c'
        \ . '[^|]*/'

endif

highlight default link HimalayaSeparator VertSplit
highlight default link HimalayaId        Identifier
highlight default link HimalayaFlags     Special
highlight default link HimalayaSubject   String
highlight default link HimalayaSender    Structure
highlight default link HimalayaDate      Constant

let b:current_syntax = 'himalaya-email-listing'
