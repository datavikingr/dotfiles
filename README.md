# <span style="color:rebeccapurple">My Dots

My little slice of `$HOME`.

## <span style="color:rebeccapurple">Installing/Adding New Dots of Files to This Repo
1. Build the dir structure relative to $HOME inside of `$HOME/dotfiles` (eg, `~/dotfiles/.local/bin` for `$HOME/.local/bin`)
2. Move the desired file to the new folder its new home in `~/dotfiles/` (__PRO TIP:__ use a GUI file manager - it's just easier.)
3. `cd $HOME/dotfiles` (or use alias `gitroot` from anywhere in the dotfiles directory) & `stow .` this will create the appropriate symlink to 'real' file in the its old home (its filepath prior to step 1)
4. <span style="color:lightgreen">**Verify in Thunar**</span> that everything looks correct. Both folders, per the earlier example: real files in `~/dotfiles/.local/bin` and symlinks in `$HOME/.local/bin`. **<span style="color:red">Do not skip this step.</span>** Adjust as required.
5. From `$HOME/dotfiles`, `git add .`
6. `git commit -m "relevant message"`
7. `git push origin main`
8. From Thunar, in `$HOME/dotfiles`, `CTRL+A` & `CTRL+C`; navigate to `$HOME/.dotbak` and press `CTRL+V`
9. Attempts at scripting this have gone poorly. Feel free to try again, but right now, I feel its best to handle it manually, to prevent unnecessary headaches and git reversions.
10. Add required window rules to `/home/dataviking/dotfiles/.config/hypr/UserConfigs/WindowRules.conf`
11. For applications to show up correctly in Rofi, please see the below options:

### <span style="color:rebeccapurple">Installing Web Apps
 - 'Installing' web apps works as normal/expected, including Rogi integration. No further action is required, except window rules, see Step 10 in <a href="#installingadding-new-dots-to-this-repo">Installing/Adding New Dots to This Repo</a>

### <span style="color:rebeccapurple">Installing Steam Games
1. .desktop files are stored in `/home/dataviking/.var/app/com.valvesoftware.Steam/.local/share/applications/`

2. Edit each and add `flatpak run com.valvesoftware.Steam :` in front of `steam steam://rungameid/XXXXXX` in the Exec= line. <span style="color:lightgreen">**RESULT:**</span> It should like like `Exec=flatpak run com.valvesoftware.Steam :steam steam://rungameid/1086940` using Baldur's Gate 3 as an example. 

3. <a href="#installingadding-new-dots-to-this-repo">Continue adding/installing as normal.</a>

### <span style="color:rebeccapurple">Installing Flatpaks
1. `flatpak list` to find the correct application title
2. Add new alias to bash_aliases. Flatpaks have their own section above functions. For example: `alias steam="flatpak run com.valvesoftware.Steam"`
3. Download new icon to `$HOME/Pictures/icons/`
3. Navigate to `$HOME/dotfiles/.local/share/applications`
4. Make new .desktop file. It should contain the following:
```
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=[Application name]
Exec=flatpak run [application name as found in Step 1]
Icon=/home/dataviking/dotfiles/Pictures/icons/[filename].png
StartupWMClass=[I set this the same as the Name= value above]
```
6. <a href="#installingadding-new-dots-to-this-repo">Continue adding/installing as normal.</a>

## <span style="color:rebeccapurple">.bash_aliases
Sourced in `.zshrc` in spite of the name. Some of the hits: 
 - `home` - head to $HOME or the root of a repo, respectively
 - `back` - a browser's back button in your cli
 - `open` - the same effect as double-clicking a file in a file manager - *it just opens*
 - `trash` - dumps files to GUI Trash from cli
 - `update` - updates nala, pacstall, and deb-get repos all in one swing.
 - `cd` - runs `ls -pa` automatically, per the cl function.
 - `quickdict` - lists *all* installed commands, tldrs selection.
 - `commanddict` - same thing as `quickdict`, but with the full man page
 - `gitlog` - a functional, aesthetic read out for the latest commits.
 - `gitignore {filename}` - removes {filename} from the cache and adds it to `.gitignore` (Double check it landed on a new line)
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

## <span style="color:rebeccapurple">Software Package
 - stow, fzf, tldr, tree, ranger, bmon, btop, htop, micro, tmux, docker, gsw
 - gnugo, gnu-chess, nethack
 - stacer, gparted, timeshift, deb-get, pacstall, nala, flatpak
 - steam, anytype, heroic, signal, mullvad, brave, libreoffice writer, bitwarden, calibre, discord

## <span style="color:rebeccapurple">Installation From Nothing

1. Install minimal Debian Testing to bare metal.
2. Run the following from $HOME:
```
git clone https://github.com/futurehaskins/dotfiles.git
cd dotfiles/.tools
./debianhyprland.sh
```
3. Restart when prompted. You'll land in a hyprland desktop. Sign in.
4. Press `SUPER+Enter` (`SUPER` usually is just `WIN`) to launch kitty (terminal).
5. Run the following: `dotfiles/tools/freshinstall.sh`
6. And then finish with `dotfiles/tools/installdots.sh`

**Result:** `freshinstall.sh` installs my desired software package. Then, `installdots.sh` deletes relevant files from $HOME, replaces them with `stow`-based symlinks, per the directory structure in the cloned repository (this was tested extensively in barebones Debain docker containers - it is confirmed to be good). 

**FINAL STEPS:** Restart. Upon sign in, sign in to everything.