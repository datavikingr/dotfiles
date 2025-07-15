#!/usr/bin/env bash
# called from $HOME/.config/sway/config.d/sysbinds.conf

swaymsg reload
pkill waybar
waybar
makoctl reload