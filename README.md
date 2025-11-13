# Using [Unexpected Keyboard](https://github.com/Julow/Unexpected-Keyboard)
[Custom Layouts](https://github.com/Julow/Unexpected-Keyboard/blob/master/doc/Custom-layouts.md)
- Set keyboard height to **10%**
- Change shift="0" to 10 for tablets
- My top rows contains macros
- My ",V" mapping is my smart selection/copy. See init.vim

<div style="max-height: 200px; overflow-y: auto;">
```
<?xml version="1.0" encoding="utf-8"?>
<keyboard name="termux_neovim" script="latin" bottom_row="false">

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

