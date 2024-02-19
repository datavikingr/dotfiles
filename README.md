# <span style="color:rebeccapurple">My Dots

My little slice of `$HOME`.

**NOTE:** 'Installing' web apps works as normal/expected. They do require `windowrulesv2` tweaks, utilizing `title` to make them tile correctly after install. No sweat.

## <span style="color:rebeccapurple">.bash_aliases
Sourced in `.zshrc` in spite of the name. Some of the hits: 
 - `home` - head to $HOME or the root of a repo, respectively
 - `back` - a browser's back button in your cli
 - `open` - the same effect as double-clicking a file in a file manager - *it just opens*
 - `trash` - access to the trash can from cli
 - `update` - updates nala, pacstall, and deb-get repos all in one swing.
 - `cd` - runs `ls -pa` automatically.
 - `quickdict` - lists *all* installed commands, tldrs selection.
 - `commanddict` - same thing as `quickdict`, but with the full man page
 - `gitlog` - a functional, aesthetic read out for the latest commits.
 - `gitignore {filename}` - removes {filename} from the cache and adds it to `.gitignore`
 - `gitroot` - heads to the root directory of a git repo

## <span style="color:rebeccapurple">Window-to-Desktop Rules
1. kitty
2. Thunar
3. Brave
4. VS Codium
5. Godot
6. Krita/Gimp
7. Calibre
8. Signal/Discord
9. Thunderbird/Anytype
10. Steam/Games

## <span style="color:rebeccapurple">Applications
 - stow, fzf, tldr, tree, ranger, bmon, btop, htop, micro, tmux, docker, gsw
 - gnugo, gnu-chess, nethack
 - stacer, gparted, timeshift, deb-get, pacstall, nala, flatpak
 - steam, heroic, signal, mullvad, brave, libreoffice writer, bitwarden, calibre, discord

## <span style="color:rebeccapurple">Installation

Install minimal Debian Testing to bare metal.

```
git clone https://github.com/futurehaskins/dotfiles.git
cd dotfiles/.tools
./debianhyprland.sh
```
Restart when prompted. You'll land in a hyprland desktop. Press `SUPER+Enter` (`SUPER` usually is just `WIN`) to launch kitty (terminal).

```
cd dotfiles/tools
./freshinstall.sh
./installdots.sh
```

**Result:** Both `freshinstall.sh` installs my desired software package (minus Steam, MullVad, and Anytype - which are web-grabs). Then, `installdots.sh` deletes relevant files from $HOME, replaces them with `stow`-based symlinks, per the directory structure in the cloned repository.