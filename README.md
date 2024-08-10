![README](README.JPG)
## How I wrote bacionejs on an Android tablet
[Bacione Javascript Editor](https://github.com/bacionejs/editor) is an Integrated Development Environment (IDE) for programming small javascript games on a phone. Several games are included.

I used the Neovim editor to create the Bacionejs editor. Below is my setup.

## Installed
- [termux](https://github.com/termux)
- apache
- neovim
- conquer of completion

## Configured termux extra-keys to replace entire keyboard
- termux.properties
- init.vim

## Which Editor to Use for Programming on a Phone/Tablet Offline?

There are several editors available on the Play Store, but **Termux** combined with **Neovim** stands out as the superior choice. However, vim motions aren’t optimized for typing with a thumb.

To address this issue, I created **[bacionejs](https://github.com/bacionejs/editor)**, which is designed specifically for programming small JavaScript games on mobile devices offline. For more extensive programming tasks, Neovim remains the recommended option.

## Access with or without Wi-Fi

- **Access Apache via Wi-Fi**: Use localhost `127.0.0.1:8080` (no internet required).
- **Airplane mode**: In airplane mode the Chrome browser Refresh button doesn't refresh.
As a workaround click back OR forward to refresh (toggling between 2 dummy URL queries).
This workaround is fine as it is still only ONE click.
BTW, you don't need the dummy queries, just click back AND forward, but that is TWO clicks.
Clearing the browser cache also works but that is 10 clicks.
The two dummy URL queries might look like:
  - 127.0.0.1:8080/index.html?1
  - 127.0.0.1:8080/index.html?2
  
- **An Alternative to Apache**:
  - Edit files in `~/storage/downloads`.
  - Open the file in a browser from the file manager.
  - This method works only if it is a single monolithic file with an `.html` suffix.
  - To prevent syntax highlighting issues when editing combined HTML/JavaScript files, use the Neovim command `:syntax sync fromstart`.


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




