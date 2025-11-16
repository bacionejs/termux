**Termux/Neovim**

<img src="README.jpg" alt="README image" width="30%">

<details><summary>Features</summary>

A good keyboard setup is an important part of **reducing frustration** when coding on a phone with a thumb. My configuration uses termux extra-keys **for the entire keyboard** (hack 🤯) and supports these **features**:  
- all 32 special keys are visible
- all alphabetic keys have swipe-up capitals
- jump prev/next
- close file
- jump next buffer. swipe-up: jump next terminal
- save. swipe-up: backup
- esc. swipe-up: ctrl
- copy (context-aware selection)
- paste
- undo/redo
- toggle comments. swipe-up: comments and pastes duplicate
- toggle highlight (\*)

</details><details><summary>termux.properties</summary>

```properties
extra-keys-text-all-caps = false
hide-soft-keyboard-on-startup = true
shortcut.previous-session = ctrl + 1

# For tablets add 9 blank keys in the left of each row to push the keyboard to the right side for ease of right-thumb typing.  
extra-keys = [\
[ \
{key:HOME,display:'<<'}, {key:END,display:'>>'},\
'DOWN', 'UP', \
{macro:"ESC CTRL o",display:'<'}, {macro:"ESC CTRL i",display:'>'},\
{macro:"ESC :bw ENTER",display:'K'},\
{macro:"ESC :bn ENTER",popup:{macro:"CTRL 1"},display:'N'},\
{macro:"ESC :w ENTER",popup:{macro:",B"},display:'💾'},\
{key:ESC,popup:{key:CTRL},display:'X'}\
], \
[ \
'?', 'QUOTE', \
'LEFT', 'RIGHT', \
{macro:",V",display:'📄'}, {key:p,display:'📋'},\
{macro:"ESC u",display:'↩️'}, {macro:"ESC CTRL r",display:'↪️'},\
{macro:"ESC +",popup:{macro:"ESC yypk+"},display:'//'},\
'TAB'\
], \
[ '(', ')', '{', '}', '[', ']', ',', ';', '.', ':'], \
[ '&', '|', '+', '-', '=', '!', '<', '>', '*', '/'], \
[ 'BACKSLASH', '`', 'APOSTROPHE', '@', '#', '_', '%', '~', '^', '$'], \
[ '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'], \
[ {key:'q',popup:'Q'},{key:'w',popup:'W'},{key:'e',popup:'E'},{key:'r',popup:'R'},{key:'t',popup:'T'},{key:'y',popup:'Y'},{key:'u',popup:'U'},{key:'i',popup:'I'},{key:'o',popup:'O'},{key:'p',popup:'P'}], \
[ {key:'a',popup:'A'},{key:'s',popup:'S'},{key:'d',popup:'D'},{key:'f',popup:'F'},{key:'g',popup:'G'},{key:'h',popup:'H'},{key:'j',popup:'J'},{key:'k',popup:'K'},{key:'l',popup:'L'},{macro:"CTRL ^",display:'⇧'}], \
[ {key:'z',popup:'Z'},{key:'x',popup:'X'},{key:'c',popup:'C'},{key:'v',popup:'V'},{key:'b',popup:'B'},{key:'n',popup:'N'},{key:'m',popup:'M'},{key:'SPACE',display:' '},{key:'BKSP'},'ENTER'] \
]
```

</details><details><summary>init.vim</summary>

```vimscript
" Hack for extra-keys capslock, activated with c-^. 
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" backs up current file to ~/delete/timestampedfile
nnoremap ,B :let fname = substitute(fnamemodify(expand('%:p'), ':h:t') . '/' . expand('%:t'), '/', '_', '') . '_' . strftime('%Y%m%d_%H%M%S') \| call mkdir(expand('~/delete'), 'p') \| call system('cp -n ' . shellescape(expand('%:p')) . ' ' . expand('~/delete/') . fname) \| echo 'Copied to: ~/delete/' . fname<CR>

" toggles * highlight. also prevents auto-advance.
nnoremap <silent><expr> * (&hls && v:hlsearch ? ':noh' : ':let @/= "\\<" . expand("<cword>") . "\\>" \| set hls')."\n"

" toggles comments
nnoremap + :call CommentReplaceAndMove()<CR>
function! CommentReplaceAndMove()
    let c = substitute(&commentstring, '%s', '', '')
    execute 'silent! :s#^#'.c.'#e|s#^'.c.c.'##e'
    normal! j
endfunction

" Context-aware selection. for example yiw becomes only one click
" also works with paragraphs, quotes and blocks
inoremap ,V <Esc>:call SuperSelect()<CR>
nnoremap ,V :call SuperSelect()<CR>
" extends selection
vmap ,V :<C-u>call ExtendSelection()<CR>
function! SuperSelect() | let c=getline('.')[col('.')-1] | if c=~'\w'|normal! viw|elseif c=~'"'|normal! va"|elseif c=~'^\s*$'|normal! jvap|elseif c=~'[][}{)(]'|normal! v%|if line("'>")-line("'<")+1>1|normal! V|if c=~'[]})]'|normal! o|endif|let i=line('.')+1|while i<=line('$')&&getline(i)=~#'^\s*$'|normal! j|let i+=1|endw|endif|endif|normal! ygv|endfunction
function! ExtendSelection() | normal! gvl | let c=getline('.')[getpos("'>")[2]] | let c2=getline('.')[getpos("'>")[2]+1] | if c=~'[[({]'|normal! %|elseif c=~'\w'&&c2=~'\w'|normal! e|endif|endfunction
```

</details>

---

For simple stuff, try **BacioneJS**

<a href="//bacionejs.github.io/editor/bacionejs.html" target="_blank"> <img src="https://repository-images.githubusercontent.com/788276995/5a729f8a-02e1-4c07-bb85-895e23758cee" width="100%"> </a>

---
