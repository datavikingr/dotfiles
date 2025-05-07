#!/usr/bin/env bash
# called from $HOME/.config/sway/config.d/sysbinds.conf

grim -g "$(slurp)" - | wl-copy