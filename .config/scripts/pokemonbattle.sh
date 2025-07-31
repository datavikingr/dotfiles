#!/usr/bin/env bash

right_justify() {
  local width pad plain
  width=$(tput cols)
  while IFS= read -r line; do
    # Strip ANSI escape codes for accurate visible width
    plain=$(sed 's/\x1b\[[0-9;]*m//g' <<< "$line")
    pad=$((width - ${#plain}))
    if (( pad > 0 )); then
      printf "%*s%s\n" "$pad" "" "$line"
    else
      echo "$line"
    fi
  done
}

center_justify() {
  local width pad plain
  width=$(tput cols)
  while IFS= read -r line; do
    # Strip ANSI escape codes for visible width calculation
    plain=$(sed 's/\x1b\[[0-9;]*m//g' <<< "$line")
    pad=$(( (width - ${#plain}) / 2 ))
    if (( pad > 0 )); then
      printf "%*s%s\n" "$pad" "" "$line"
    else
      echo "$line"
    fi
  done
}

pokemon-colorscripts -rn nidoking,trevenant,butterfree,arcanine,mew,poochyena,torterra,lycanroc,corviknight,boltund,abra,meowth,bulbasaur,slowking --no-title | right_justify
echo "VERSUS" | center_justify
pokemon-colorscripts -r --no-title