
There are several Android code editors available on the Play Store, but **Termux** combined with **Neovim** stands out as the superior choice. However, vim motions aren’t optimized for typing with a **thumb**. To address this issue, I created the **[BacioneJS](https://github.com/bacionejs/editor)** editor IDE, which is designed specifically for programming small JavaScript games on mobile devices offline. But for more extensive programming tasks, **Termux/Neovim** remains the recommended option.

---

**Termux/Neovim**

A good keyboard setup is an important part of **reducing frustration** when coding on a phone with a thumb.  
Below are two keyboard solutions:
- Unexpected-Keyboard
- termux-extra-keys (hack using as entire keyboard).  
My **Termux/Neovim** configurations below are for phones. For tablets change shift="0" to 10 or add blank keys.  
To toggle hiding the keyboard or extra-keys, swipe-right on termux left and long-press or click "keyboard".  
My configurations below support these **shortcuts**:  
- jump prev/next
- jump next buffer
- jump next terminal
- save
- backup
- close file
- undo/redo
- ctrl/esc
- comment line. swipeup comments and pastes duplicate
- context-aware selection

---

Using [Unexpected-Keyboard](https://github.com/Julow/Unexpected-Keyboard/blob/master/doc/Custom-layouts.md) for keyboard  
Set keyboard height to **10%**  

```layout```
```xml
<?xml version="1.0" encoding="utf-8"?>
<keyboard name="termux_neovim" script="latin" bottom_row="false">

<row>
<key shift="0" c="home"/> <key c="end"/> <key c="up"/> <key c="down"/>
<key c="&lt;:esc,ctrl,o"/> <key c="&gt;:esc,ctrl,i"/>
<key w="config" e="switch_forward" c="change_method_prev" nw="switch_clipboard" n="change_method" sw="voice_typing" s="compose"/>
<key c="esc"/>
<key c="S:esc,:w,enter" e="N:esc,:bn,enter" s="K:esc,:bw,enter" n="B:\,B" w="T:ctrl,1"/>
<key c="ctrl"/>
</row>
<row>
<key shift="0" c="?"/> <key c="&quot;"/>
<key c="left"/> <key c="right"/>
<key c="C:\,V"/> <key c="P:p"/>
<key c="U:esc,u"/> <key c="R:esc,ctrl,r"/>
<key c="//:esc,+" n="=:esc,yypk+"/>
<key c="tab"/>
</row>
<row> <key shift="0" c="("/> <key c=")"/> <key c="{"/> <key c="}"/> <key c="["/> <key c="]"/> <key c=","/> <key c=";"/> <key c="."/> <key c=":"/> </row>
<row> <key shift="0" c="&amp;"/> <key c="|"/> <key c="+"/> <key c="-"/> <key c="="/> <key c="!"/> <key c="&lt;"/> <key c="&gt;"/> <key c="*"/> <key c="/"/> </row>
<row> <key shift="0" c="1" n="\\"/> <key c="2" n="`"/> <key c="3" n="'"/> <key c="4" n="@"/> <key c="5" n="#"/> <key c="6" n="_"/> <key c="7" n="%"/> <key c="8" n="~"/> <key c="9" n="^"/> <key c="0" n="$"/> </row>
<row> <key shift="0" c="q" n="Q"/> <key c="w" n="W"/> <key c="e" n="E"/> <key c="r" n="R"/> <key c="t" n="T"/> <key c="y" n="Y"/> <key c="u" n="U"/> <key c="i" n="I"/> <key c="o" n="O"/> <key c="p" n="P"/> </row>
<row> <key shift="0" c="a" n="A"/> <key c="s" n="S"/> <key c="d" n="D"/> <key c="f" n="F"/> <key c="g" n="G"/> <key c="h" n="H"/> <key c="j" n="J"/> <key c="k" n="K"/> <key c="l" n="L"/> <key c="shift"/> </row>
<row> <key shift="0" c="z" n="Z"/> <key c="x" n="X"/> <key c="c" n="C"/> <key c="v" n="V"/> <key c="b" n="B"/> <key c="n" n="N"/> <key c="m" n="M"/> <key c="space"/> <key c="backspace"/> <key c="enter"/> </row>

</keyboard>
```
---
Using [termux extra-keys](https://wiki.termux.com/wiki/Touch_Keyboard) **for entire keyboard**  

```termux.properties```
```properties
hide-soft-keyboard-on-startup = true
shortcut.previous-session = ctrl + 1

extra-keys = [\
[ \
{macro:"ESC CTRL o",display:'<'},\
{macro:"ESC CTRL i",display:'>'},\
{macro:"ESC +",popup:{macro:"ESC yypk+"},display:'//'},\
{macro:",V",display:'V'},\
{macro:"ESC :bw ENTER",display:'K'},\
{macro:"ESC :bn ENTER",popup:{macro:"CTRL 1"},display:'N'},\
{macro:"ESC u",display:'U'},\
{macro:"ESC CTRL r",display:'R'},\
{macro:"ESC :w ENTER",popup:{macro:",B"},display:'S'},\
{key:ESC,display:'X'}\
], \
[  '?',  'QUOTE',  {key:HOME,display:'<<'}, {key:END,display:'>>'}, 'LEFT',  'RIGHT',  'DOWN',  'UP',  'TAB',  {key:CTRL,display:'C'} ], \
[  '(',  ')',  '{',  '}',  '[',  ']',  ',',  ';',  '.',  ':' ], \
[  '&',  '|',  '+',  '-',  '=',  '!',  '<',  '>',  '*',  '/' ], \
[  'BACKSLASH',  '`',  'APOSTROPHE',  '@',  '#',  '_',  '%',  '~',  '^',  '$' ], \
[  '1',  '2',  '3',  '4',  '5',  '6',  '7',  '8',  '9',  '0' ], \
[ {key:'q',popup:'Q'}, {key:'w',popup:'W'}, {key:'e',popup:'E'}, {key:'r',popup:'R'}, {key:'t',popup:'T'}, {key:'y',popup:'Y'}, {key:'u',popup:'U'}, {key:'i',popup:'I'}, {key:'o',popup:'O'}, {key:'p',popup:'P'} ], \
[ {key:'a',popup:'A'}, {key:'s',popup:'S'}, {key:'d',popup:'D'}, {key:'f',popup:'F'}, {key:'g',popup:'G'}, {key:'h',popup:'H'}, {key:'j',popup:'J'}, {key:'k',popup:'K'}, {key:'l',popup:'L'}, {key:"BKSP",popup:{macro:"CTRL ^"}} ], \
[ {key:'z',popup:'Z'}, {key:'x',popup:'X'}, {key:'c',popup:'C'}, {key:'v',popup:'V'}, {key:'b',popup:'B'}, {key:'n',popup:'N'}, {key:'m',popup:'M'}, {key:'SPACE',display:' '}, {key:'SPACE',display:' '}, 'ENTER' ] \
]



```
---
```init.vim```
```
let mapleader=","

" Hack for extra-keys capslock, activated with c-^. 
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" backs up current file to ~/delete/timestampedfile
nnoremap ,B :let fname = substitute(fnamemodify(expand('%:p'), ':h:t') . '/' . expand('%:t'), '/', '_', '') . '_' . strftime('%Y%m%d_%H%M%S') \| call mkdir(expand('~/delete'), 'p') \| call system('cp -n ' . shellescape(expand('%:p')) . ' ' . expand('~/delete/') . fname) \| echo 'Copied to: ~/delete/' . fname<CR>

" toggles * highlight. also prevents auto-advance.
nnoremap <silent><expr> * (&hls && v:hlsearch ? ':noh' : ':let @/= "\\<" . expand("<cword>") . "\\>" \| set hls')."\n"

" toggles comments. also, i pair it with swipeup, which comments and pastes.
nnoremap + :call CommentReplaceAndMove()<CR>
function! CommentReplaceAndMove()
    let c = substitute(&commentstring, '%s', '', '')
    execute 'silent! :s#^#'.c.'#e|s#^'.c.c.'##e'
    normal! j
endfunction

" Context-aware selection.  for example yiw becomes V (less clicks).
" also works with paragraphs, quotes and blocks
inoremap ,V <Esc>:call SuperSelect()<CR>
nnoremap ,V :call SuperSelect()<CR>
" extends selection
vmap ,V :<C-u>call ExtendSelection()<CR>
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
```

<img src="README.jpg" alt="README image" width="30%">
