#!/usr/bin/env bash
# called from $HOME/.config/scripts/life_os.sh

files=("$HOME/code/pdf2sgf/sgfs"/*.sgf); gnugo --mode=ascii -l "${files[RANDOM % ${#files[@]}]}"