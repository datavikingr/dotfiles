#!/usr/bin/env bash
# called from $HOME/.config/sway/config.d/eyecandy.conf

# wallpapers directory
WALLPAPER_DIR="$HOME/pictures/wallpapers"

# roll for random file
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)

# set wallpaper with swaybg
swaybg -i "$RANDOM_WALLPAPER" -m fill &
