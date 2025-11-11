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


" backup current file to ~/delete/timestampedfile
nnoremap ,B :let fname = substitute(fnamemodify(expand('%:p'), ':h:t') . '/' . expand('%:t'), '/', '_', '') . '_' . strftime('%Y%m%d_%H%M%S') \| call mkdir(expand('~/delete'), 'p') \| call system('cp -n ' . shellescape(expand('%:p')) . ' ' . expand('~/delete/') . fname) \| echo 'Copied to: ~/delete/' . fname<CR>




" remove whitespace in file
function! CleanJSAll()
  " Replace quoted strings, preserving internal spaces
  %s/\v"([^"]*)"/\="\"" . substitute(submatch(1), ' ', '__SPACE__', 'g') . "\"" /g

  " Handle ' of ' and ' in ' with spacing replaced
  %s/\v\s+of\s+/__SPACE__of__SPACE__/g
  %s/\v\s+in\s+/__SPACE__in__SPACE__/g

  " Add __SPACE__ after certain keywords, including multiple in a row
  let @/ = ''
  while 1
    let l:before = join(getline(1, '$'), "\n")
    %s/\v<(function|let|return|new|const|async|await|typeof|import|from)>(\s+)/\1__SPACE__/g
    let l:after = join(getline(1, '$'), "\n")
    if l:before == l:after
      break
    endif
  endwhile

  " Replace 'else if' and 'else <word>' separately
  %s/\velse\s+if/else__SPACE__if/g
  %s/\velse\s+(\w)/else__SPACE__\1/g

  " Replace leading indentation with __INDENT__
  %s/^\s\+/\=substitute(matchstr(getline('.'), '^\s\+'), ' ', '__INDENT__', 'g')/g

  " Remove all remaining spaces
  %s/ //g

  " Restore placeholders
  %s/__SPACE__/ /g
  %s/__INDENT__/ /g
endfunction

command! CleanJSAll call CleanJSAll()
nnoremap <Leader>F :CleanJSAll<CR>






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


