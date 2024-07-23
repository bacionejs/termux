au BufEnter * if &buftype == 'terminal' | :startinsert | endif
filetype indent off
set autoindent
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)
set hidden
set showbreak=>\ 
let mapleader=","

" soft-shift activated with c-^. See termux.properties.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" toggles *. also prevents auto-advance.
nnoremap <silent><expr> * (&hls && v:hlsearch ? ':noh' : ':let @/= "\\<" . expand("<cword>") . "\\>" \| set hls')."\n"
" toggles comments
nnoremap + :call CommentReplaceAndMove()<CR>
" Context-aware selection. ciw becomes Vc, one less click.
" also works with paragraphs, quotes and blocks
inoremap ,V <Esc>:call SuperSelect()<CR>
nnoremap ,V :call SuperSelect()<CR>
" extends selection
vmap ,V :<C-u>call ExtendSelection()<CR>

function! CommentReplaceAndMove()
    let c = substitute(&commentstring, '%s', '', '')
    execute 'silent! :s#^#'.c.'#e|s#^'.c.c.'##e'
    normal! j
endfunction

function! SuperSelect()
let c = getline('.')[col('.') - 1]
if c =~ '\w'
  normal! viw
elseif c =~ '"'
  normal! va"
elseif c =~ '^\s*$'
  normal! jvap
elseif c =~ '[][}{)(]'
  normal! v%
  if line("'>") - line("'<") + 1 > 1
    normal! V
    if c =~ '[]})]'
      normal! o
    endif
    let i = line('.') + 1
    while i <= line('$') && getline(i) =~# '^\s*$'
      normal! j
      let i += 1
    endwhile
  endif
endif
normal! ygv
endfunction

function! ExtendSelection()
    normal! gvl
    let c = getline('.')[getpos("'>")[2]]
    let c2 = getline('.')[getpos("'>")[2] + 1]
    if c =~ '[[({]'
        normal! %
    elseif c =~ '\w' && c2 =~ '\w'
        normal! e
    endif
endfunction


