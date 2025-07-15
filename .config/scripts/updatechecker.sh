#!/usr/bin/env bash

UPDATES=$(checkupdates 2> /dev/null | wc -l)
AUR_UPDATES=$(yay -Qua 2> /dev/null | wc -l)

TOTAL=$((UPDATES + AUR_UPDATES))

if [[ $TOTAL -gt 0 ]]; then
    echo "{\"text\": \"📦 $TOTAL\", \"tooltip\": \"$UPDATES repo, $AUR_UPDATES AUR updates available\", \"class\": \"updates-available\"}"
else
    echo "{\"text\": \"✔️\", \"tooltip\": \"System up to date\", \"class\": \"updates-clean\"}"
fi