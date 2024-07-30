![README](README.JPG)
## How I wrote bacionejs on an Android tablet
[Bacione Javascript Editor](https://github.com/bacionejs/editor) is an Integrated Development Environment (IDE) for programming small javascript games on a phone. Several games are included.

I used the Neovim editor to create the Bacionejs editor. Below is my setup.

## Installed
- [termux](https://github.com/termux)
- nodejs
- apache
- neovim
- conquer of completion

## Configured termux extra-keys to replace entire keyboard
- termux.properties
- init.vim

## Access with or without Wi-Fi

- **Access Apache via Wi-Fi**: Use `localhost 127.0.0.1:8080` (no internet required).
- **If no Wi-Fi is available**: Use a hotspot. To refresh the page, navigate back and then forward in the browser, as the normal refresh doesn't work with a hotspot.
- **An Alternative to Apache**:
  - Edit files in `~/storage/downloads`.
  - Open the file in a browser from the file manager.
  - This method works only if it is a single monolithic file with an `.html` suffix.
  - To prevent syntax highlighting issues when editing combined HTML/JavaScript files, use the Neovim command `:syntax sync fromstart`.

## Which Editor to Use for Programming on a Phone/Tablet Offline?

There are several editors available on the Play Store, but **Termux** combined with **Neovim** stands out as the superior choice. However, vim motions aren’t optimized for typing with a thumb.

To address this issue, I created **[bacionejs](https://github.com/bacionejs/editor)**, which is designed specifically for writing small JavaScript games on mobile devices. For more extensive programming tasks, Neovim remains the recommended option.
