width=$(tput cols)
pokemon-colorscripts -n nidoking | while IFS= read -r line; do
  # Remove ANSI escape codes for length calculation
  plain=$(sed 's/\x1b\[[0-9;]*m//g' <<< "$line")
  pad=$((width - ${#plain}))
  # Only pad if pad > 0
  if (( pad > 0 )); then
    printf "%*s%s\n" $pad "" "$line"
  else
    echo "$line"
  fi
done