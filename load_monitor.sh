#!/bin/bash
SESSION=$USER

tmux -2 new-session -d -s $SESSION

# Setup a window for tailing log files
tmux new-window -t $SESSION:1 -n 'Logs'
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "htop" C-m
tmux select-pane -t 1
tmux send-keys "docker stats" C-m
tmux split-window -v
tmux send-keys "iftop" C-m
# Setup a CoffeeScript compiler/watchdog pane
tmux select-pane -t 0
tmux split-window -v
tmux send-keys "tail -f /cache/steam/logs/access.log" C-m
tmux split-window -v
tmux send-keys "tail -f /cache/steam/logs/error.log" C-m

tmux select-layout tiled
