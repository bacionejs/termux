![README](README.JPG)
## How I wrote bacionejs on an Android tablet
[Bacione Javascript Editor](https://github.com/bacionejs/editor) is an Integrated Development Environment (IDE) for programming small javascript games on a phone. Several games are included.

I used the Neovim editor to create the Bacionejs editor. Below is my setup.

## Installed
- termux
- nodejs
- apache
- neovim
- conquer of completion

## Configured termux extra-keys to replace entire keyboard
- termux.properties
- init.vim

## Access with or without wifi
- Access Apache via wifi and localhost 127.0.0.1:8080 (no internet required).
- If no wifi, then use hotspot, but use back, then forward in browser to refresh because normal refresh doesn't work with hotspot.
- Or edit in neovim via ~/storage/downloads and open in browser from file manager. This method only works if it is one monolithic file with a html suffix. And to prevent syntax highlighting issues when editing a combo html/javascript file, use neovim :syntax sync fromstart.

## Which editor should you use for programming on a phone/tablet?
There are several editors on the playstore but Termux/Neovim is superior. Download Termux via github and install Neovim via pkg install.

However, vim-motions are't designed for typing with a thumb

To address this I wrote bacionejs [why](https://github.com/bacionejs/editor?tab=readme-ov-file)
