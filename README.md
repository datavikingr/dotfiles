# My Dots

My little slice of `$HOME`.

## Step 1. 
 - Install minimal Debian Testing to bare metal.

**Result:** Boots into terminal prompt with no desktop.

## Step 2. 
 - `git clone https://github.com/futurehaskins/dotfiles.git`

**Result:** Cloned the required repo.

## Step 3. 
 - `cd dotfiles/.tools`

 - `./debianhyprland.sh` 

 - Restart when prompted.

**Result:** Functional hyprland desktop.

## Step 4. 
 - CTRL+Enter to launch kitty (terminal).

 - `cd dotfiles/tools`

 - `./freshinstall.sh`

**Result:** Deploys personal software package.

## Step 5. 
 - `./installdots.sh`

**Result:** Deletes relevant files from $HOME, replaces them with `stow`-based symlinks, per the directory structure in the cloned repository.

<span style="color:red">**UNTESTED**</span> - Please use extreme caution.

## Step 6.
Additional software, downloaded from the web:

 - steam
 - discord
 - MullvadVPN
 - anytype

`sudo nala install [file name]` from the downlaod location.

## Step 7. 
Grab everything off my external drive, as required. That's the docs, music, pictures, all the personal files.

## Step 8.
Profit.