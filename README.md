# <span style="color:rebeccapurple">My Dots

My little slice of `$HOME`. I'm basically using this as a backup for a hyper-light weight system that can run on chrultrabook'ed Acer R13.

_Currently running:_ Arch + SwayFX

### Requirements
 - Arch
 - Stow
 - git

 ### Installation
 Stow and pacman do all the havy lifting here. First, clone the repo. Then cd into the repo directory. 
 
 Run the pacman command to install everything I have (so far). 
 
 Then run the script found in the tools stow-package.  This will dump everything where it needs to go in your user's $HOME.
 ```bash
 git clone https://github.com/datavikingr/dotfiles.git
cd dotfiles
sudo pacman -S --needed - < pkglist.txt
yay -S --needed - < pkglist-aur.txt
tools/.local/bin/bootstrapdots.sh
```

VS Code/Codium workspace file included for your convenience.