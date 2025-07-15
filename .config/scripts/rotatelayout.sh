#!/usr/bin/env bash
# called from $HOME/.config/sway/config.d/sysbinds.conf

swaymsg mark left
swaymsg focus right
swaymsg move window to mark left
swaymsg focus parent
swaymsg layout toggle split