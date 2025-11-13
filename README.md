# Try these keyboard setups

## Using [Unexpected Keyboard](https://github.com/Julow/Unexpected-Keyboard)
- Set keyboard height to **10%**
- Change shift="0" to 10 for tablets
- My top rows contains macros and mappings. See init.vim
- My mappings
  - ",B" is timestamped backup
  - ",V" is smart selection/copy 
  - "//:esc,+" is comment toggle

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

## Using termux extra-keys **for entire* keyboard**

```properties
terminal-cursor-blink-rate = 1000
terminal-cursor-style = bar
extra-keys-text-all-caps = false
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

```

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


```

# all alphabetic keys have swipeup for capital
# <>: jump prev/next
# //: toggle comment line. swipeup comments and pastes duplicate
# V : context-aware selection. see init.vim
# K : close buffer
# N : jump next buffer. swipeup jump next terminal.
# UR: undo/redo
# S : save. swipeup create timestamped backup.
# X : escape
# <<: home
# >>: end
# C : ctrl
# backspace. swipeup toggles fake capslock in insert mode.
- termux.properties
- init.vim

<img src="README.jpg" alt="README image" width="30%">

## How I wrote bacionejs on Android
[Bacione Javascript Editor](https://github.com/bacionejs/editor) is an Integrated Development Environment (IDE) for programming small javascript games on a phone. Several games are included.

I used the Neovim editor to create the Bacionejs editor. Below is my setup.

## Installed
- [termux](https://github.com/termux)
- apache
- neovim
- conquer of completion

## Which Editor to Use for Programming on a Phone/Tablet Offline?

There are several editors available on the Play Store, but **Termux** combined with **Neovim** stands out as the superior choice. However, vim motions aren’t optimized for typing with a **thumb**.

To address this issue, I created **[bacionejs](https://github.com/bacionejs/editor)**, which is designed specifically for programming small JavaScript games on mobile devices offline. For more extensive programming tasks, Neovim remains the recommended option.

## Unexpected Keyboard

### ⚠️ Beware
- My top row contains **Neovim mappings**.  
  For example, `S` is actually `<space>S` (where `<space>` is the leader key).  
  This mapping triggers `:w` (save). You’ll likely want to remove these mappings.
- I no longer use this keyboard, so you won’t find these mappings in my current `init.vim`.


