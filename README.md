```markdown
<div style="max-height: 200px; overflow-y: auto;">

```xml
<?xml version="1.0" encoding="utf-8"?>
<keyboard name="termux_neovim" script="latin" bottom_row="false">
<!--
Beware: the top two rows contain neovim macros and some point to functions in init.vim. You will probably want to remove those.
-->

<row>
<key shift="0" c="home"/>
<key c="end"/>
<key c="up"/>
<key c="down"/>
<key c="&lt;:esc,ctrl,o"/>
<key c="&gt;:esc,ctrl,i"/>
<key w="config" e="switch_forward" c="change_method_prev" nw="switch_clipboard" n="change_method" sw="voice_typing" s="compose"/>
<key c="esc"/>
<key c="S:esc,:w,enter" e="N:esc,:bn,enter" s="K:esc,:bw,enter" n="B:\,B" w="T:ctrl,1"/>
<key c="ctrl"/>
</row>
<row>
<key shift="0" c="?"/>
<key c="&quot;"/>
<key c="left"/>
<key c="right"/>
<key c="C:\,V"/>
<key c="P:p"/>
<key c="U:esc,u"/>
<key c="R:esc,ctrl,r"/>
<key c="//:esc,+" n="=:esc,yypk+"/>
<key c="tab"/>
</row>
<row>
<key shift="0" c="("/>
<key c=")"/>
<key c="{"/>
<key c="}"/>
<key c="["/>
<key c="]"/>
<key c=","/>
<key c=";"/>
<key c="."/>
<key c=":"/>
</row>
<row>
<key shift="0" c="&amp;"/>
<key c="|"/>
<key c="+"/>
<key c="-"/>
<key c="="/>
<key c="!"/>
<key c="&lt;"/>
<key c="&gt;"/>
<key c="*"/>
<key c="/"/>
</row>
<row>
<key shift="0" c="1" n="\\"/>
<key c="2" n="`"/>
<key c="3" n="'"/>
<key c="4" n="@"/>
<key c="5" n="#"/>
<key c="6" n="_"/>
<key c="7" n="%"/>
<key c="8" n="~"/>
<key c="9" n="^"/>
<key c="0" n="$"/>
</row>
<row>
<key shift="0" c="q" n="Q"/>
<key c="w" n="W"/>
<key c="e" n="E"/>
<key c="r" n="R"/>
<key c="t" n="T"/>
<key c="y" n="Y"/>
<key c="u" n="U"/>
<key c="i" n="I"/>
<key c="o" n="O"/>
<key c="p" n="P"/>
</row>
<row>
<key shift="0" c="a" n="A"/>
<key c="s" n="S"/>
<key c="d" n="D"/>
<key c="f" n="F"/>
<key c="g" n="G"/>
<key c="h" n="H"/>
<key c="j" n="J"/>
<key c="k" n="K"/>
<key c="l" n="L"/>
<key c="shift"/>
</row>
<row>
<key shift="0" c="z" n="Z"/>
<key c="x" n="X"/>
<key c="c" n="C"/>
<key c="v" n="V"/>
<key c="b" n="B"/>
<key c="n" n="N"/>
<key c="m" n="M"/>
<key c="space"/>
<key c="backspace"/>
<key c="enter"/>
</row>


</keyboard>
```
</div>
```

## Configured termux extra-keys to replace entire keyboard
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

A great keyboard for coding in **Neovim on Termux (Android)** is:  
[Unexpected Keyboard](https://github.com/Julow/Unexpected-Keyboard)

### My Layout
[View my layout](https://github.com/bacionejs/termux/blob/main/unexpectedkeyboardphone.txt)

### Custom Layout Guide
To learn how to create your own layout, see the documentation:  
[Custom Layouts](https://github.com/Julow/Unexpected-Keyboard/blob/master/doc/Custom-layouts.md)

### Tips
- Set keyboard height to **15%** for optimal use.

### ⚠️ Beware
- My top row contains **Neovim mappings**.  
  For example, `S` is actually `<space>S` (where `<space>` is the leader key).  
  This mapping triggers `:w` (save). You’ll likely want to remove these mappings.
- I no longer use this keyboard, so you won’t find these mappings in my current `init.vim`.


## Access with or without Wi-Fi

- **Access Apache via Wi-Fi**: Use localhost `127.0.0.1:8080` (no internet required).
- **Access Apache in Airplane Mode**: In airplane mode the Chrome browser Refresh button doesn't refresh.
As a workaround click back OR forward to refresh (toggling between 2 dummy URL queries).
This workaround is fine as it is still only ONE click.
BTW, you don't need the dummy queries, just click back AND forward, but that is TWO clicks.
Clearing the browser cache also works but that is 10 clicks. You could also increment the dummy query but that is 4 click.
The two dummy URL queries might look like:
  - 127.0.0.1:8080/index.html?1
  - 127.0.0.1:8080/index.html?2
  
- **An Alternative to Apache**:
  - Edit files in `~/storage/downloads`.
  - Open the file in a browser from the file manager.
  - This method works **only** if it is a single monolithic file with an `.html` suffix.
  - To prevent syntax highlighting issues when editing combined HTML/JavaScript files, use the Neovim command `:syntax sync fromstart`.
  - An alternative to file manager is to make a bookmark. To make a bookmark, edit an existing bookmark and point it to `file:///storage/emulated/0/download/index.html`


- **Also in Apache try**:

```apache
<filesMatch "\.(html|js|css)$">
    FileETag None
    <ifModule mod_headers.c>
       Header unset ETag
       Header set Cache-Control "max-age=0, no-cache, no-store, must-revalidate"
       Header set Pragma "no-cache"
       Header set Expires "Wed, 11 Jan 1984 05:00:00 GMT"
    </ifModule>
</filesMatch>




