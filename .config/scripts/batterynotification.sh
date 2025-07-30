#!/usr/bin/env bash
# called from $HOME/.config/waybar/config

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)
mouse=$(upower -i $(upower -e | grep battery_hidpp_battery_0) | grep "percentage" | awk '{print $2}')

notify-send -t 10000 "Battery Info" "Laptop: $capacity% - $status \nMouse: $mouse"