#!/usr/bin/env bash

SESSION="life_os"

# Start new tmux session in detached mode, named life_os, and first page is newsboat
tmux new-session -d -s "life_os" -n news 'newsboat'
# Create window 2: weather
tmux new-window -t "$SESSION":2 -n weather 'curl https://wttr.in/Joppatowne'
# Create window 3: calendar
tmux new-window -t "$SESSION":3 -n calendar 'calcurse'
# Create window 4: zen
tmux new-window -t "$SESSION":4 -n zen 'gnugo'
tmux split-window -h -t "$SESSION":4
sleep .2
tmux send-keys -t "$SESSION":4.2 'cbonsai -S' C-m
# Create window 5: editing
tmux new-window -t "$SESSION":5 -n editing 'ranger'
# Create window 6: normal shell
tmux new-window -t "$SESSION":6 -n zsh
tmux select-window -t "$SESSION":4.2
tmux attach-session -t "$SESSION"
