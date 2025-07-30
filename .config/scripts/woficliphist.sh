#!/usr/bin/env bash
# called from $HOME/.config/waybar/config

#cliphist list | wofi --dmenu | cliphist decode | wl-copy
#cliphist list | head -n 10 | wofi --dmenu | cliphist decode | wl-copy
#cliphist list | sort -n | wofi --dmenu | cliphist decode | wl-copy
#cliphist list | head -n 9 | sed 's/^[0-9]\+ //' | wofi --dmenu --no-sort | cut -d' ' -f1 | xargs -I{} cliphist decode {} | wl-copy
cliphist list | sort -k1,1nr | head -n 25 | sort -r | wofi --dmenu --sort-order=default | cut --delimiter=" " --fields=2 | xargs -I{} cliphist decode {} | wl-copy