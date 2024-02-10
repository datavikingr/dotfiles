# My Dots

My little slice of `$HOME`.

# Installation

Install minimal Debian Testing to bare metal.

```
git clone https://github.com/futurehaskins/dotfiles.git
cd dotfiles/.tools
./debianhyprland.sh
```
Restart when prompted. You'll land in a hyprland desktop. Press `CTRL+Enter` to launch kitty (terminal).

```
cd dotfiles/tools
./freshinstall.sh
./installdebs.sh
./installdots.sh
```
**Result:** Both `freshinstall.sh` & `installdebs.sh` install relevant software package. Then, `installdots.sh` deletes relevant files from $HOME, replaces them with `stow`-based symlinks, per the directory structure in the cloned repository.