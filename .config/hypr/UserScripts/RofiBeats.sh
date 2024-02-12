#!/bin/bash

# Directory for icons
iDIR="$HOME/.config/swaync/icons"

# Note: You can add more options below with the following format:
# ["TITLE"]="link"

# Define menu options as an associative array
declare -A menu_options=(
  ["Lofi Girl"]="https://www.youtube.com/watch?v=jfKfPfyJRdk"
  ["Chiptunes"]="https://www.youtube.com/watch?v=kYxMjsKT5Wk"
  ["breakcore & dnb"]="https://www.youtube.com/watch?v=xu7pKyD0D-4"
  ["Lofi Boy"]="https://www.youtube.com/watch?v=4xDzrJKXOOY"
  ["Beneath The Mask"]="https://www.youtube.com/watch?v=Uq7kyf1T_lk"
  ["Dark Academia"]="https://www.youtube.com/watch?v=csxo1flT530"
  ["Metal - No Vocals"]="https://www.youtube.com/watch?v=9kGTJfwPSzI"
  ["Dark Synth"]="https://www.youtube.com/watch?v=MGJWPha7rJw"
  ["Minecraft - C418"]="https://www.youtube.com/watch?v=2xg71fa1CfI"
  ["i finally feel like myself again"]="https://www.youtube.com/watch?v=XGTIVDt7CfU"
  ["Chillhop Radio"]="https://www.youtube.com/watch?v=7NOSDKb0HlU"
  ["Coffee House Jazz"]="https://www.youtube.com/watch?v=f_WCg5WpFC8"
  ["Celtic Tavern"]="https://www.youtube.com/watch?v=pFrdrhZEgiw"
  ["Aggro Synth"]="https://www.youtube.com/watch?v=YXDM0RB_LeM"
)

# Function for displaying notifications
notification() {
  notify-send -u normal -i "$iDIR/music.png" "Playing now: $@"
}

# Main function
main() {
  choice=$(printf "%s\n" "${!menu_options[@]}" | rofi -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -i -p "")

  if [ -z "$choice" ]; then
    exit 1
  fi

  link="${menu_options[$choice]}"

  notification "$choice"
  
  # Check if the link is a playlist
  if [[ $link == *playlist* ]]; then
    mpv --shuffle --vid=no "$link"
  else
    mpv --vid=no "$link"
  fi
}

# Check if an online music process is running and send a notification, otherwise run the main function
pkill mpv && notify-send -u low -i "$iDIR/music.png" "Online Music stopped" || main
